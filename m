Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 159DBC83007
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 02:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUrceejOWnViwzEhfQQHny/I7h0B5BkSFEJwcr0Qtj4=; b=AKjPxYxVRZcemFI+9i8/YnhQmr
	W3Ehd6vE36MjmJY7TL5cUvf47dR9yfpu/DO9wp9EVGTsNLUs7oeMHLTooQx+2qKD/v06Lvw27kEu9
	IXS9hpOrtYdCPewTAJy6juu3eo4aGQ6FlX0vmGOA0hkcla5kJE+XzBticrvYEyJsWbiw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNhox-0005aE-6g;
	Tue, 25 Nov 2025 01:26:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNhot-0005a5-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PH9yNJj0mS6jx2VNE2EB3vdpACFEXHNFnPZRgaxoNrk=; b=es3B5jA4dLnlJzVg5T0A4f7ajH
 U+3Gj/gZZVPOwdV8ldPyKbQsjjMtErZg9wt/Ee6/v0iJWCjQSSnxq7/Bm3Uk3E7aZQCsH1qyFnMFr
 786PfNVudgOBd6LGUBEh7+Ba/FCX1hxLMRFJDb3oOIFwdYAdSJSK6UlBJk2RUDbSsGB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PH9yNJj0mS6jx2VNE2EB3vdpACFEXHNFnPZRgaxoNrk=; b=lLV1rumddjnTNX/nP4o6zRWcmw
 +je+q6AUFzq5IdZ4+r8mH2KTHpkX6drTojGqkYnuEpDd2PIMHhAsBOsNIem+/aVbpqZX+x1rzqUu+
 LAa7MVCuuADCBUg1sZ8UB+elcLMSDYLZssVAY+r8APL2CeZVXAwT8HZcejIezfX+n6EI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNhos-0002BS-S0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D591600CB;
 Tue, 25 Nov 2025 01:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC70CC4CEF1;
 Tue, 25 Nov 2025 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764033968;
 bh=VYmxOkP4afOkMLMP+cIzFB1il8Q1NPvsoRTWTjWgGiE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V/XlmhxY1xLN48uw0l+MLTUhcNuMpnmRz21O0iz+Q7MFJfCxixddJprcUVfN6rUvg
 WWzfJ0TvF3FBmyTOtQuBG0/G532C2T1yTAUsuZjgEPb0aNprM7Ev4R9bhZ+p89lb30
 cgcOZf4nmKfVFZkNaBIiEJZ+RnJHw+PsJadHnc+v2l8hZxmFPcQuxk/eO18zdj5uT2
 7zlDoGwi3Lp/JFJ9cvv/Bj6Ggn/NUuj0yBroKu3e8RR8Y7fk5ph3/ZijAKBJ3C5N+g
 iWTtY8mu9Xo1RzKJDnOwtRH6RQYXBh87UBZ3Swmks12nDsYYvXUz4yjSDxPuN82Vgc
 1RH/bEaRs2Vzg==
Message-ID: <372a0544-fefc-4a14-bf4f-059b85a5065d@kernel.org>
Date: Tue, 25 Nov 2025 09:26:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org
References: <20251124084255.3033493-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20251124084255.3033493-1-zangyangyang1@xiaomi.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/24/2025 4:42 PM,
 Yangyang Zang wrote: > Commit 42482e81248f
 ("resize.f2fs: add caution message for resize") > introduced the `-F' option
 to force resizing f2fs without displaying > the caution m [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNhos-0002BS-S0
Subject: Re: [f2fs-dev] [PATCH v2] resize.f2fs: add -g to give default
 options
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/24/2025 4:42 PM, Yangyang Zang wrote:
> Commit 42482e81248f ("resize.f2fs: add caution message for resize")
> introduced the `-F' option to force resizing f2fs without displaying
> the caution message. And `add_default_options()` implies that `-g'
> enables `-F' for resize by default. However resize.f2fs does not
> currently support the `-g' option. This patch adds `-g' for it.
> 
> Fixes: 42482e81248f ("resize.f2fs: add caution message for resize")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
> ---
> Changes in v2:
>   - Modify the commit message as suggested by shengyong
> ---
>   fsck/main.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/main.c b/fsck/main.c
> index f7ef092..08d38d8 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -145,6 +145,9 @@ void resize_usage()
>   	MSG(0, "[options]:\n");
>   	MSG(0, "  -d debug level [default:0]\n");
>   	MSG(0, "  -H support write hint\n");
> +	MSG(0, "  -f ignore errors during resize\n");
> +	MSG(0, "  -F force to resize\n");
> +	MSG(0, "  -g add default options\n");

Need to update manual page of resize.f2fs as well?

Thanks,

>   	MSG(0, "  -o overprovision percentage [default:auto]\n");
>   	MSG(0, "  -s safe resize (Does not resize metadata)\n");
>   	MSG(0, "  -t target sectors [default: device size]\n");
> @@ -640,7 +643,7 @@ void f2fs_parse_options(int argc, char *argv[])
>   #endif
>   	} else if (!strcmp("resize.f2fs", prog)) {
>   #ifdef WITH_RESIZE
> -		const char *option_string = "d:fFHst:o:V";
> +		const char *option_string = "d:fFg:Hst:o:V";
>   
>   		c.func = RESIZE;
>   		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -664,6 +667,12 @@ void f2fs_parse_options(int argc, char *argv[])
>   				c.force = 1;
>   				MSG(0, "Info: Force to resize\n");
>   				break;
> +                        case 'g':
> +                                if (!strcmp(optarg, "android")) {
> +                                        c.defset = CONF_ANDROID;
> +                                        MSG(0, "Info: Set conf for android\n");
> +                                }
> +                                break;
>   			case 'H':
>   				c.need_whint = true;
>   				c.whint = WRITE_LIFE_NOT_SET;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
