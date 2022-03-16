Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C264DAE13
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Mar 2022 11:08:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUQZd-0000I9-8R; Wed, 16 Mar 2022 10:08:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nUQZc-0000Hi-8E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 10:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ITP14Tvv/FN6ONqVkFH5EGKUKKFYW0xSIh06VqL2gY=; b=Erksfzt3DbmsFFsyQ5fznE5mzm
 LHNBmJsx5j2Mk1+n1IbczbjHVybX1To1iTfFiL8JMBkj3h8wnLoEZCFZgVGq1DG9m4FHjsczA/FYI
 abVITwbnF/mxiePL4oNTlIdACzSp84grvTzBpDxEqDqGKdSBQqlOAYZJOT0esL49MHPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ITP14Tvv/FN6ONqVkFH5EGKUKKFYW0xSIh06VqL2gY=; b=hb2cJKfiJ1DiM2EF9QBcfLNXNf
 LrI5ufofUDoNr1xueDc/KrJhgqpH9cOrPF35kwJmRgZ8a6eI9MLHZ6xPZ/wGJ9PXQ9fy47nU/WgOu
 HwB4LPoew5Xsp+6btk6CnHIw7M99S+EVEEfzpUzBi5iMePTXBOEbO/qe8yyw4a71KHUs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUQZA-0007ec-ME
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 10:07:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C2FBB81731;
 Wed, 16 Mar 2022 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707B5C340E9;
 Wed, 16 Mar 2022 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647424826;
 bh=N6/eftwupi9ZKbXW+bkYAwhv2SRaTUXVuVgrSe8CGZM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mPFL3Wk58VqFWTdOilXBrHTZxlRoEgMaA0zVPFBA89WMx+mQ7eYV6TrTpf8nh24+I
 Ddf3RHzXEJIo6C8nsQJUFjTddr6asxrQLtPEgMEbqHSowu2UZ+nZX7HN8MupI9xkIS
 iOif5eYC3ycewGAsZ4ERysaZxPkQ38Wv6CfF2X1Ot2dYK2fRFjRizlntDpoj7LVWdl
 f6V4cgq3WLXVh6ZvyJqGNBFibqbzp2J0NHOR/oBks0g4mIhrK7Z4+JmWpmjPex8qGE
 mrDy5kYVKgwU9HpH0Szi92ZrDhYGGd3ZeZf9YbZVRX2/NfIqaP3bR16mVWnivTFmwB
 yrGOjHltvociQ==
Message-ID: <708c18e8-8497-6557-c0d9-8a39f30459cd@kernel.org>
Date: Wed, 16 Mar 2022 18:00:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Juhyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
 <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
 <376d12ed-afd0-41d7-495c-054bfd24d5d1@kernel.org>
 <CAD14+f3SnZir_Q7pyVzFZ6zHJendYyxYfGaxP9iLEDQuPE=AZw@mail.gmail.com>
 <CAD14+f1_smUWHgZRffuTNfsmCk-j_LL_vw5RuWffGdnd=vP8BA@mail.gmail.com>
 <YjD78BmHAKBHj3wN@google.com>
 <CAD14+f2nSy710HggEVfzRAipL_7F=HHmqc9mG4oyLrn2=AhzXw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAD14+f2nSy710HggEVfzRAipL_7F=HHmqc9mG4oyLrn2=AhzXw@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/16 16:43, Juhyung Park wrote: > Hi Jaegeuk, > >
 I'll perform the trace debugging later. > > Meanwhile, we encountered another
 issue. > > For now, I added a workaround that performs mlockall( [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nUQZA-0007ec-ME
Subject: Re: [f2fs-dev] EIO returned when reading files from R/O,
 compressed f2fs image
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/16 16:43, Juhyung Park wrote:
> Hi Jaegeuk,
> 
> I'll perform the trace debugging later.
> 
> Meanwhile, we encountered another issue.
> 
> For now, I added a workaround that performs mlockall() on all files
> (vmtouch -L $val.mount -d -w -P $val.vmtouch) under the f2fs partition
> so that the cp command works.
> 
> After confirming that extraction works, I've parallelized the script
> again (on our production server again, so v5.15 without f2fs-stable
> backports) and while userspace processes don't complain, there's
> something going on on dmesg:
> 
> [224319.321668] loop0: detected capacity change from 0 to 11041080
> [224319.361530] F2FS-fs (loop0): Found nat_bits in checkpoint
> [224319.365029] F2FS-fs (loop0): write access unavailable, skipping recovery
> [224319.365033] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> [224340.047471] loop1: detected capacity change from 0 to 11769352
> [224340.101509] F2FS-fs (loop1): Found nat_bits in checkpoint
> [224340.103799] F2FS-fs (loop1): write access unavailable, skipping recovery
> [224340.103802] F2FS-fs (loop1): Mounted with checkpoint version = 4321
> [224361.763528] loop2: detected capacity change from 0 to 11386480
> [224361.812891] F2FS-fs (loop2): Found nat_bits in checkpoint
> [224361.814881] F2FS-fs (loop2): write access unavailable, skipping recovery
> [224361.814886] F2FS-fs (loop2): Mounted with checkpoint version = 4321
> [224386.701011] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [224386.701248] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [224386.701779] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [224386.701806] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [224386.701826] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [224391.823216] loop3: detected capacity change from 0 to 11045240
> [224391.884383] F2FS-fs (loop3): Found nat_bits in checkpoint
> [224392.194608] F2FS-fs (loop3): write access unavailable, skipping recovery
> [224392.194612] F2FS-fs (loop3): Mounted with checkpoint version = 4321
> [224401.386330] loop4: detected capacity change from 0 to 11428112
> [224401.424575] F2FS-fs (loop4): Found nat_bits in checkpoint
> [224401.428872] F2FS-fs (loop4): write access unavailable, skipping recovery
> [224401.428875] F2FS-fs (loop4): Mounted with checkpoint version = 4321
> [224576.100839] loop0: detected capacity change from 0 to 11041080
> [224576.140862] F2FS-fs (loop0): Found nat_bits in checkpoint
> [224576.142694] F2FS-fs (loop0): write access unavailable, skipping recovery
> [224576.142699] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> [224599.330003] loop1: detected capacity change from 0 to 2913344
> [224599.360425] F2FS-fs (loop1): Found nat_bits in checkpoint
> [224599.362257] F2FS-fs (loop1): write access unavailable, skipping recovery
> [224599.362260] F2FS-fs (loop1): Mounted with checkpoint version = 4321
> [224602.241868] loop2: detected capacity change from 0 to 2064344
> [224602.276146] F2FS-fs (loop2): Found nat_bits in checkpoint
> [224602.277955] F2FS-fs (loop2): write access unavailable, skipping recovery
> [224602.277971] F2FS-fs (loop2): Mounted with checkpoint version = 4321
> [224629.346056] loop3: detected capacity change from 0 to 41776
> [224629.375324] F2FS-fs (loop3): Found nat_bits in checkpoint
> [224629.377167] F2FS-fs (loop3): write access unavailable, skipping recovery
> [224629.377170] F2FS-fs (loop3): Mounted with checkpoint version = 4321
> [225029.224078] loop0: detected capacity change from 0 to 11411472
> [225029.270396] F2FS-fs (loop0): Found nat_bits in checkpoint
> [225029.271345] F2FS-fs (loop0): write access unavailable, skipping recovery
> [225029.271348] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> [225625.045254] loop0: detected capacity change from 0 to 11045240
> [225625.078435] F2FS-fs (loop0): Found nat_bits in checkpoint
> [225625.079453] F2FS-fs (loop0): write access unavailable, skipping recovery
> [225625.079455] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> [225651.466438] loop1: detected capacity change from 0 to 11428112
> [225651.532489] F2FS-fs (loop1): Found nat_bits in checkpoint
> [225651.582589] F2FS-fs (loop1): write access unavailable, skipping recovery
> [225651.582594] F2FS-fs (loop1): Mounted with checkpoint version = 4321
> [225653.729775] loop2: detected capacity change from 0 to 2896696
> [225653.817115] F2FS-fs (loop2): Found nat_bits in checkpoint
> [225653.842649] F2FS-fs (loop2): write access unavailable, skipping recovery
> [225653.842654] F2FS-fs (loop2): Mounted with checkpoint version = 4321
> [225665.480652] loop3: detected capacity change from 0 to 2064344
> [225665.548952] F2FS-fs (loop3): Found nat_bits in checkpoint
> [225665.551460] F2FS-fs (loop3): write access unavailable, skipping recovery
> [225665.551465] F2FS-fs (loop3): Mounted with checkpoint version = 4321
> [225687.173551] loop4: detected capacity change from 0 to 3753984
> [225687.297132] F2FS-fs (loop4): Found nat_bits in checkpoint
> [225687.299702] F2FS-fs (loop4): write access unavailable, skipping recovery
> [225687.299705] F2FS-fs (loop4): Mounted with checkpoint version = 4321
> [225694.934235] loop5: detected capacity change from 0 to 1868760
> [225695.047462] F2FS-fs (loop5): Found nat_bits in checkpoint
> [225695.049562] F2FS-fs (loop5): write access unavailable, skipping recovery
> [225695.049567] F2FS-fs (loop5): Mounted with checkpoint version = 4321
> [225704.254531] loop6: detected capacity change from 0 to 41776
> [225704.282972] F2FS-fs (loop6): Found nat_bits in checkpoint
> [225704.286725] F2FS-fs (loop6): write access unavailable, skipping recovery
> [225704.286730] F2FS-fs (loop6): Mounted with checkpoint version = 4321
> [225723.689515] loop0: detected capacity change from 0 to 11411472
> [225723.723250] F2FS-fs (loop0): Found nat_bits in checkpoint
> [225723.725740] F2FS-fs (loop0): write access unavailable, skipping recovery
> [225723.725744] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> [225727.574004] loop2: detected capacity change from 0 to 11386480
> [225727.621016] F2FS-fs (loop2): Found nat_bits in checkpoint
> [225727.623296] F2FS-fs (loop2): write access unavailable, skipping recovery
> [225727.623300] F2FS-fs (loop2): Mounted with checkpoint version = 4321
> [225728.404524] loop3: detected capacity change from 0 to 41776
> [225728.440403] F2FS-fs (loop3): Found nat_bits in checkpoint
> [225728.442743] F2FS-fs (loop3): write access unavailable, skipping recovery
> [225728.442748] F2FS-fs (loop3): Mounted with checkpoint version = 4321
> [225731.328330] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [225731.328400] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [225731.328424] F2FS-fs (loop2): lz4 invalid rlen:16384, expected:16384
> [225743.064116] loop1: detected capacity change from 0 to 11769352
> [225743.110306] F2FS-fs (loop1): Found nat_bits in checkpoint
> [225743.113408] F2FS-fs (loop1): write access unavailable, skipping recovery
> [225743.113414] F2FS-fs (loop1): Mounted with checkpoint version = 4321
> [225761.148410] loop3: detected capacity change from 0 to 3758152
> [225761.195014] F2FS-fs (loop3): Found nat_bits in checkpoint
> [225761.196431] F2FS-fs (loop3): write access unavailable, skipping recovery
> [225761.196432] F2FS-fs (loop3): Mounted with checkpoint version = 4321
> [225766.885693] loop4: detected capacity change from 0 to 1868760
> [225767.010849] F2FS-fs (loop4): Found nat_bits in checkpoint
> [225767.013024] F2FS-fs (loop4): write access unavailable, skipping recovery
> [225767.013027] F2FS-fs (loop4): Mounted with checkpoint version = 4321
> [225781.475142] loop5: detected capacity change from 0 to 3766472
> [225781.500625] F2FS-fs (loop5): Found nat_bits in checkpoint
> [225781.503148] F2FS-fs (loop5): write access unavailable, skipping recovery
> [225781.503150] F2FS-fs (loop5): Mounted with checkpoint version = 4321
> [225785.367635] loop6: detected capacity change from 0 to 1868760
> [225785.474029] F2FS-fs (loop6): Found nat_bits in checkpoint
> [225785.475673] F2FS-fs (loop6): write access unavailable, skipping recovery
> [225785.475678] F2FS-fs (loop6): Mounted with checkpoint version = 4321
> [225802.664721] loop7: detected capacity change from 0 to 41776
> [225802.706846] F2FS-fs (loop7): Found nat_bits in checkpoint
> [225802.709092] F2FS-fs (loop7): write access unavailable, skipping recovery
> [225802.709095] F2FS-fs (loop7): Mounted with checkpoint version = 4321
> [225812.972186] loop0: detected capacity change from 0 to 41776
> [225813.000175] F2FS-fs (loop0): Found nat_bits in checkpoint
> [225813.003617] F2FS-fs (loop0): write access unavailable, skipping recovery
> [225813.003619] F2FS-fs (loop0): Mounted with checkpoint version = 4321
> 
> Those "lz4 invalid rlen:16384, expected:16384", is this normal?

Juhyung, good catch.

I guess this is the place in where it returns EIO in your scenario.

Actually, it looks we printed the wrong variable in the message... could
you please change the code as below, using "ret" instead of "dic->rlen",
and try another test to check the log.

static int lz4_decompress_pages()
{
...
	if (ret != PAGE_SIZE << dic->log_cluster_size) {
		printk_ratelimited("%sF2FS-fs (%s): lz4 invalid rlen:%zu, "
					"expected:%lu\n", KERN_ERR,
					F2FS_I_SB(dic->inode)->sb->s_id,
					ret,
					PAGE_SIZE << dic->log_cluster_size);
		return -EIO;
	}
	return 0;
}

Not sure, is it possible that you can share this f2fs image in somewhere?
then I can check details of this issue directly w/ the image.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
