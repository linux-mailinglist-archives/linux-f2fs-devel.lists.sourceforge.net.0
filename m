Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8639A4E2068
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 07:03:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWB0y-00058n-I6; Mon, 21 Mar 2022 06:03:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nWB0v-00058h-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 06:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/rUKkPkIn5Mh3N0w0FHVkUtMKw0cmnro52BeZKBlDtY=; b=MXQ2v+FmTZx423nUCUtdr2PYZL
 CW6FX0AzMpf81ZgP9OPbnkBsPO7iC0bIBvZCGdelsUCcpIXDnM0hS0QBhYh1Sx3o+67n9uI67RoJ6
 4exmGNtC6+XVyUTk8gN5iaHK2TqN4qRp5pQDhPJdcthSdH0Qas8pYznLggvBMpkg1UdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/rUKkPkIn5Mh3N0w0FHVkUtMKw0cmnro52BeZKBlDtY=; b=JNJ0cxEAqpiJxAMQjNdCaL28xE
 Tcgxm2BtJRSDLZ/+DSPvDqUwz14anGWizPbrzwX1JdTi4+5MQBuWQp3RwzgI5m7K7Fm0qAXyCoSTX
 w6ZV28nviO5XKxxg7YYPI2Ed/WgEj5qxwyW4ywRYqPGJPMgUPXH4q71Hht+cZZS20SRQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWB8l-0004iB-UW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 06:03:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A616FB80EF1;
 Mon, 21 Mar 2022 06:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EA1C340E8;
 Mon, 21 Mar 2022 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647842607;
 bh=efLAVB0nSzbYv/m/A/NPOwlcDtnwvwLg7BFu2lzeRPs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Y0dbTCIIjXKAWFIMu8PIYgvGc7bTnYnFiyxLDFuKfG4dz6S1hX7O5mlNiHCXO75cq
 YF2B4rfcaAXsisyEhYgQASkjlFEE/CzD+nu/sZdhoDypGGdioKl2ITDzLJw4UsKdze
 pgvTG9APfNGOvQaKqvMT207lBKcbOSM3d9Hq/ycUlti+QqYH9x0HIvJdvX4vEGbSG7
 /QCXOOFJzmidXRCchxVDsWMFN66bOEfAYvCfOpyx+9BM5vnahtm/ZoVUwfc+48638s
 EU/YiODKm/FCMxufRwSx6ZJDx7PWK3I4qBBBFedzIXTVCu5pq4CoBPBk23ZTXOBgBT
 D+va+8t1GUiNQ==
Message-ID: <b491875c-c6a8-1243-35cf-649be3250b5d@kernel.org>
Date: Mon, 21 Mar 2022 14:03:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Tomas Mudrunka <mudrunka@spoje.net>, linux-f2fs-devel@lists.sourceforge.net
References: <f4e22b0dff793f75b5c37a170acba03c@spoje.net>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <f4e22b0dff793f75b5c37a170acba03c@spoje.net>
X-Spam-Score: -6.1 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/19 20:55, Tomas Mudrunka wrote: > Hello, > i've
 noticed that mkfs.f2fs does not allow files to be copied to > filesystem
 during
 formating by mkfs.f2fs. > Do you think it would be hard to add [...] 
 Content analysis details:   (-6.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWB8l-0004iB-UW
Subject: Re: [f2fs-dev] Populate f2fs with files during mkfs.f2fs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/19 20:55, Tomas Mudrunka wrote:
> Hello,
> i've noticed that mkfs.f2fs does not allow files to be copied to
> filesystem during formating by mkfs.f2fs.
> Do you think it would be hard to add such feature?
> 
> I understand that this might be a weird request which in some sense
> defies the definition of filesystem formating process. But there are
> also some arguments for this case.
> 
> In the world of embedded development we often need to build firmware
> images to be flashed into the device. And F2FS is one of the best suited
> filesystems for embedded and perhaps the one best for managed flash. So
> we naturaly want to use it and build into our fw images. However to
> build such image i need to create f2fs image, format it and then mount
> it using loopback, copy data to it, unmount, sync, handle errors, etc...
> And we have huge makefiles or stuff like genimage, to put all the image
> partitions and bootloaders and everything together. It just adds quite
> complexity to the embedded build systems.
> 
> Turns out that quite few filesystems already have this feature to
> simplify creating filesystem images without need for mounting or root
> permissions:
> 
> mkfs.ext4 -d ./input_directory
> mkfs.ubifs -d ./input_directory
> mkfs.jffs2 -d ./input_directory
> mkcramfs (obviously)
> mksquashfs (obviously)
> 
> would you please consider adding such feature as well?

Hi Tomas,

Can sload.f2fs satisfy this requirement?

Thanks,

> 
> Thank you
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
