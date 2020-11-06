Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA892A9AFF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 18:39:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kb5iE-0001pe-6f; Fri, 06 Nov 2020 17:39:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <josef@toxicpanda.com>) id 1kb5iC-0001pX-VR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 17:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ANXxIZx8OahFtF4xzwzNX4YdqVaHg2s+5GptZte/gOE=; b=Fyh6iwgpbP3JtORZww3laDBGc4
 +b6ZK6XFaauMhqlq3usIl/vxVmtDeE8cVwa5nWrvfz3EhHkeWg1SJGMaeft3kafsnQ+9oQdPrECD3
 cdSvEq4TUly0JbX/0ctJnkeDRydX/DljmxHxCYKAoIusER2mOE0LcRUKFTU14Ue7Rb/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ANXxIZx8OahFtF4xzwzNX4YdqVaHg2s+5GptZte/gOE=; b=O9biP3hsYEGtpV/ao7J9RuRHg2
 L6kKrp+ebi53g9/NYjWVVDMYpxLvV4dfTiJVWJc8VaDHrJkOXi2Qg1N+6HjrIx/zrHOenOFTz1Fhh
 zO+YHHzrM6fMqSFV15KXzZ5S9aHgtBokVdQMgdw9z/4uf/VIXQft2QuS+2mH86YslvAc=;
Received: from mail-vk1-f195.google.com ([209.85.221.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kb5i7-00BnlE-K2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 17:39:44 +0000
Received: by mail-vk1-f195.google.com with SMTP id q77so418529vkq.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Nov 2020 09:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ANXxIZx8OahFtF4xzwzNX4YdqVaHg2s+5GptZte/gOE=;
 b=L63lbg2QmniDGJd5a4dxIrAFndNycIdwZhwtxYs+Qxv7y5+4iN6IKBL80tLuQ8W+ML
 8u0wO9MMvdmY0nZkdoO4X4PhNpnlmGn/jmuN5i0zBP41zIiuLPdN2qYWkoP8fwvUEdr8
 i3asb9BAg8ipiJPc5IdL8RfO3v4YzJIs0OOtUEvGvVOYKtHkAKMyj5B+rfHHYlbdRKhy
 hU7hN/sbEQw1EqDBD9c5duJHpeoPY1EnAZRbwbDgVk3DuXXBlTbwAEXtWhlVj+UheA9q
 iMn5NdRk+MyS6zFBsGNx6Gkd6a/cBIp/gTYZtLAgZrlzIdJoAhUMboc4TSdoZw5slaBM
 hmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ANXxIZx8OahFtF4xzwzNX4YdqVaHg2s+5GptZte/gOE=;
 b=rcYTNZJ6c/V7M+MQDxQC2p375sQnyTXsbGdqUrH5kHG6kCtzbs4m8WRJMjUc3I+dBe
 9HOAO1FQSp24wTLVoV9Ck4hq/Mzxe5qn5nuBX7WoSQXnACOK6u+UusZRF211RxuU7LKs
 g9IBjCAQ2xlf7+HkZenEKUGLnlusRUqttgt3yIuXGQ6NYalPe6i5RfY0QQGtNRqZ4KCA
 TO54Iy3ToW1y/6e3N30axhp/6WdPvL6AxM6rWYGyDFj59dMkDrqweqFD5+fqtZpUfFVE
 2SCS861br4O+EY4FuO9Dgrx7LreW0Qf5eNrmiJ95osYBdvE49XKlrtfn1HkzfiA30OSh
 JkUw==
X-Gm-Message-State: AOAM5330bzbwB/GbO5bOxwraAjDNvRb3R3VT0DAZ3lFOByXcF/4LpDlU
 eyJ1E4yz9qwetCiTO+zVOTn8O/kS+DetUe3CAhA=
X-Google-Smtp-Source: ABdhPJyN/9SAhQ9aRdjQ+lvSquSge3ay9Lrb+110kCzcwVvPbLGoYFikdNP97xpth1ZeP4uZJiI83Q==
X-Received: by 2002:a0c:9b91:: with SMTP id o17mr2367164qve.8.1604682938171;
 Fri, 06 Nov 2020 09:15:38 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
 [174.109.172.136])
 by smtp.gmail.com with ESMTPSA id x31sm932075qtb.81.2020.11.06.09.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 09:15:37 -0800 (PST)
To: Nick Terrell <nickrterrell@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <025719a2-2432-8204-201f-adbbd293fa9a@toxicpanda.com>
Date: Fri, 6 Nov 2020 12:15:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103060535.8460-1-nickrterrell@gmail.com>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.195 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kb5i7-00BnlE-K2
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v5 0/9] Update to zstd-1.4.6
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
Cc: squashfs-devel@lists.sourceforge.net, Johannes Weiner <jweiner@fb.com>,
 Yann Collet <cyan@fb.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/3/20 1:05 AM, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Please pull from
> 
>    git@github.com:terrelln/linux.git tags/v5-zstd-1.4.6
> 
> to get these changes. Alternatively the patchset is included.
> 

Where did we come down on the code formatting question?  Personally I'm of the 
mind that as long as the consumers themselves adhere to the proper coding style 
I'm fine not maintaining the code style as long as we get the benefit of easily 
syncing in code from the upstream project.  Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
