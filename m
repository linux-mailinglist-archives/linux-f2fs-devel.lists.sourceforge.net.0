Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E136AAADBEE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 11:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdqvf2M6ez/SGXXGPk2i/VAdcG6w3POSoShtSCRHBlk=; b=PGZyPZNWpp0JgHyzRfHkGdpaMS
	efTM85c30kA1lL5j8JELxQNb71isf57213QALHbMjRklP6jbTvEvhC4P3JEOmhy6PXZhySblPWZ6j
	xf2TQwjXituD0gRAaDJRjG0tMAM5J32wBrP/2PcdEkmahw8rmpnJHIK18jqBdZDuwgqk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCbUH-0007IO-AN;
	Wed, 07 May 2025 09:54:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCbUG-0007ID-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 09:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qpGHI8f7gRFZO9vC9bB+a+x4AbTybr8hDhkv0ROoPhw=; b=Ji+CNZaILk9RRJfkm/xqHmP6AV
 v0dnlhSHV08C/Dx4Vg2LCa0rij6oMfiYLGfxARhKNDikZ8AfeSnLn2IcFQw7XMlJ0+cf37z56OjL7
 ca8/y0PFruLkMxudeQlnTTyGcaH4qFC2cQ4FRtPfdlFDcJpILfjHgbZxcV1dP19OAZjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qpGHI8f7gRFZO9vC9bB+a+x4AbTybr8hDhkv0ROoPhw=; b=NndC7jJY0jwj+PgLN5Z1qf3N1W
 xA8fQtrRF5CRVdmqTMHWsUgOCMVXGzwS/iZpcGyKR96bpcd9QBAuV1fBXCtK9AXkVjxyUUdrsH38K
 m6kLgsw//ecy8w50pCc2fgAWVaMHG/l2RP2eaCrTYXPPngz5ZZGeORokuQDSlYDuZqsw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCbU0-0005na-PP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 09:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE9B9A4D79F;
 Wed,  7 May 2025 09:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DBAC4CEEB;
 Wed,  7 May 2025 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746611661;
 bh=L2Qq1OqoTTdxJFZxrpMedyp1KS/00lHhR1Hf9y1xqwg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YGnUVN6mZxuGKasTKmatgpnUtGBAqMamaDXGKkUiw3hN/gAZkoL1fyWM4wO7DRz60
 i6k0BdHcVy30wUrzmw/eDu0n7Amwxvvqu8Wjeju/PvoNhrvPHJpymvS74mvOx2vzFe
 ftLRSB9s4WXxFQdlAdN4wtNIf5hcg1FPVGcKbkii5Bv6ipPVEmgAJ3xFtfmkt4f9/H
 bbagiaseM1b5Uw1Lm2XmDydAG+YVOYTYe2Y5y08n7L2K9LyfNj2lz8LlI2P8lf3QgS
 FeoOarkVpYByP9MC8XHZvAUeix7fbM43UtpoDfwVgysYoUphukY0QZeuNUxqsi/BjT
 j+B98uG2p9y4Q==
Message-ID: <04099a70-c0b0-4bd5-92be-07694d9a1741@kernel.org>
Date: Wed, 7 May 2025 17:54:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-2-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250420154647.1233033-2-sandeen@redhat.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/25 23:25,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > Use an array of `fs_parameter_spec` called f2fs_param_specs to > hold
 the mount option specifications for the new mo [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCbU0-0005na-PP
Subject: Re: [f2fs-dev] [PATCH 1/7] f2fs: Add fs parameter specifications
 for mount options
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/20/25 23:25, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> Use an array of `fs_parameter_spec` called f2fs_param_specs to
> hold the mount option specifications for the new mount api.
> 
> Add constant_table structures for several options to facilitate
> parsing.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port, minor fixes and updates, more fsparam_enum]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
