Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE1CF8076
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQHDtwX2cW5ZZ2yiInPjVbMtJM41GIJLM3gzxjneW3Y=; b=GwTYknmQ+6qVMP3OSEmelVgSkG
	DeoHdoTWF0Vw0lWWBe2NJ2JdI6UzB9VHJ0n3aWi38QUeUckYLKee0b99V2kii9m0/a87OmvBD5piL
	+jlsjxNg5+sr7ByrZjrDNtMbyOQND/0Jbmnyl4i6/fQpp2dDXiSCYLT/Wo+ktC8DIW90=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd5Bt-0007z7-JN;
	Tue, 06 Jan 2026 11:25:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vd5Br-0007z0-Oz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 11:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QsMb+GT0oytlobEfn04k18UN9NxziTo+/+LN11MlVsk=; b=I1hx2Vy/flUbA/w/EVycte3FfX
 WcdTCJdzJT6OtH7vCz6IQXMNjdcwra3Qv10YHxyXxSr3UFbOInEDOkfiv1B9B1A0EqcuNlW4o8W9y
 yPhOcJGynkF72r0dswvMr4ZpY86fofhC0C4m3gCMQx8biT51Iu+ZmkwSGP537TpOSpig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QsMb+GT0oytlobEfn04k18UN9NxziTo+/+LN11MlVsk=; b=SQUq2KesbiPEaoYbyBbcFQQW/Y
 f8H0pyR1W6amfcOmR4kKQ3e5MAZTE1EbLcnQ539VTnkbosyOwuEyb3PVWjdTxfElbqWDcliV/ggZl
 OvFkpebQgdSvBmxTMlZgX2GirxGFK1mufrwayktb3uHtA+ET+aBZGw3Wd0E3eewMOjSQ=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd5Bq-0001g8-MC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 11:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=QsMb+GT0oytlobEfn04k18UN9NxziTo+/+LN11MlVsk=; b=j
 MTgSIjnZ4mNYdqG6O7/Kn+PNBO/HK9j/OnBiiXuY2G5x3HKOCJWJRiNHTJy2ixfw
 xJLCY55xP9NcyPPvGUTCldFiaIdtk/+6CSptBLZKCsSZIkKYOLXuj9M6TUT994lS
 kmUwA5YwQlT0GfcgzPeo5LsHnWa1iKCaqMcN897VgE=
Received: from nzzhao$126.com ( [212.135.214.2] ) by
 ajax-webmail-wmsvr-41-106 (Coremail) ; Tue, 6 Jan 2026 19:25:07 +0800 (CST)
X-Originating-IP: [212.135.214.2]
Date: Tue, 6 Jan 2026 19:25:07 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <9b4f9818-f8fd-4af2-8f5e-bab768bac8c9@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-4-nzzhao@126.com>
 <9b4f9818-f8fd-4af2-8f5e-bab768bac8c9@kernel.org>
X-NTES-SC: AL_Qu2dBfqSt08r4SmdYOkfmUgRgOw3XMSyu/oi2o9UO5FwjDvjwCM+V21RAXjJ+v2QDTK3tha2fiFe9t15RItDRYQ1SU5uwFgiq+8vR7o4OWvFrA==
MIME-Version: 1.0
Message-ID: <3e4421db.80e9.19b930db5fb.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aikvCgDXnywU8VxpCfs_AA--.31092W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBTywmlc8RR+jQAA33
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  At 2026-01-06 17:19:14, "Chao Yu" wrote: >On 1/5/2026 11:30
 PM, Nanzhe Zhao wrote: >>IIUC, f2fs_map_blocks(inode, &map,
 F2FS_GET_BLOCK_DEFAULT)
 won't map hole >>space, or am I missing something? >> >>Thanks, 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [212.135.214.2 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.9 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vd5Bq-0001g8-MC
Subject: Re: [f2fs-dev] [PATCH v1 3/5] f2fs: add f2fs_block_needs_zeroing()
 to handle hole blocks
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
Cc: Kim Jaegeuk <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


At 2026-01-06 17:19:14, "Chao Yu" <chao@kernel.org> wrote:
>On 1/5/2026 11:30 PM, Nanzhe Zhao wrote:

>>IIUC, f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT) won't map hole
>>space, or am I missing something?
>>
>>Thanks,

My fault, I missed the goto sync_out statement in default case. Thanks for pointing out.
_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
