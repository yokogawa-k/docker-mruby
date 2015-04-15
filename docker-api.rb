# vi: set ft=ruby ts=4 sw=4 sts=0 et:

def json_parse(body)
    begin
        json = JSON.parse(body)
    rescue ArgumentError => e
        puts "Invalid json received: #{e.message}"
    end
    return json
end

def docker_api(path)
    api = WebAPI.new "unix:///var/run/docker.sock"
    res = api.get path
    return json_parse(res.body)
end

containers = docker_api("/containers/json")

info = Hash.new()
for l in containers do
    for s in l["Names"] do
        path = "/containers/" + l["Id"] + "/json"
        inspect = docker_api(path)
        name = s.sub("/", "")
        ports = []
        for p in l["Ports"] do
            ports.push(p["PrivatePort"]) if p["Type"] == "tcp"
        end
        info[name] = {
            "ip"    => inspect["NetworkSettings"]["IPAddress"],
            "ports" => ports
        }
    end
end

puts info
