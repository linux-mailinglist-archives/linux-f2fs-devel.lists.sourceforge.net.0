Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D997A82ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Sep 2023 15:08:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qiwwC-0003yO-5C;
	Wed, 20 Sep 2023 13:08:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qiwwA-0003yH-FP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 13:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/dtup2D7UXlgC00p/MeDPUXikvorEkdra75+bV1GiJs=; b=EgqfXNlJ1cPSjD5heeoqOsjVQ5
 5EnXOVmSSYVmm/MV8M3hiRvijI4fTaKDu/dD5anFdmh2124g/9ZFcpKk9FvRMYovQRpJlSZWB9jpb
 SRgLNJ7Xzd1Ee4UvAgEdTqQC1Pf0JwnBOPUWtmQRP3+CNh4eFYtrNhLuzVtD5yF6IW4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/dtup2D7UXlgC00p/MeDPUXikvorEkdra75+bV1GiJs=; b=hMnFdFuxYZQFkMYY6czGCkREms
 54Pn4ukAQ9KyJTO+iw2uA6xtPoyUvkAvbbVZwcdjIpPVedBDxNHU6NbkAvs22az0xlMBx+hUi6qjA
 YoQEKtuKTtypRsBITUi3tYlGvTAQLuEBs7eG2JkEF/Yer2QxKC/KTYfw63aci2JRTAmA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qiww6-00GiyD-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Sep 2023 13:08:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 761F661C35;
 Wed, 20 Sep 2023 13:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1214C433C7;
 Wed, 20 Sep 2023 13:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695215284;
 bh=eFSc7ejoNNdZbOjuYmaGfFZ1951JX2lDQzGYPwMzOIY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s1OMeyG1WsWuxIdAkneA4cQCQxQ7auIwBfv7OFd8sY3v3U1QpwKPDNTrE93VXRnt+
 E0fRB1PvYBE0sizDcbbUI35hRKQjefXg3+JU40cjpBQShPOjRWKeIaTVrhcaTVZqq0
 68rMGCu9LxzyiZlzZNGkM/s4YeGPRs/cTkaL0s08Vh/dwVtAmKEThC6PxcYrYcuoIN
 OEuwXjH4d2R5wJhnTeIBUYGzUI6CrY214zIM3JSRE1wuAonOhvBo+T3gzWFwy4f38P
 K9TLj912Y/XDFnrL9RlajtvBQr8YZYtoHoEmP0lMa4dKFFks5ZCRM4oyjx2o0FxvdO
 9cQV0/HvIfWFA==
Message-ID: <bba25aab-c7a7-2e48-8280-07e05cf3d54c@kernel.org>
Date: Wed, 20 Sep 2023 21:07:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1694768423.git.bo.wu@vivo.com>
 <4ae9a0c9657efa47399953c6d8a5cd28135bc3df.1694768423.git.bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <4ae9a0c9657efa47399953c6d8a5cd28135bc3df.1694768423.git.bo.wu@vivo.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/15 17:04, Wu Bo wrote: > If the segment type is
 not matched, goto next segment to save time. > --- > fsck/mount.c | 2 ++ >
 1 file changed, 2 insertions(+) > > diff --git a/fsck/mount.c b/fsc [...]
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qiww6-00GiyD-Sf
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs-tools: skip not matched segment
 when finding free block
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/15 17:04, Wu Bo wrote:
> If the segment type is not matched, goto next segment to save time.
> ---
>   fsck/mount.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 00940b8..dccaae2 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2854,6 +2854,8 @@ next_segment:
>   		if (type == want_type && !new_sec &&
>   			!f2fs_test_bit(offset, (const char *)bitmap))
>   			return 0;
> +		if (type != want_type)
> +			goto next_segment;

if (type != want_type)
	goto next_segment;
else if (!new_sec && !f2fs_test_bit(offset, (const char *)bitmap))
	return 0;

Thanks,

>   
>   		*to = left ? *to - 1: *to + 1;
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
