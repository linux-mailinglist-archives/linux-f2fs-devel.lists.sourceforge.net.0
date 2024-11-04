Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 297169BBC4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 18:49:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t81C9-0004cY-JQ;
	Mon, 04 Nov 2024 17:48:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t81C7-0004cR-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 17:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jOpQChbady85VjphGfbgQ0josSjOZ9BtFVZ3HbNMAFc=; b=Ht+scuJ1QyZhjAHdP69QseJqei
 o2pFY5RihhfsFQZ4SgRIhSAKI+XXux7Ayf5I3Ph68GVTdFcmf4m/05MK+vUaD6QNnfvMFxdSPpCNC
 eMSRkeEgqskCX5Uu3/XLIJkJ0OXApkBWrEMYoKf6+iPuJH9T9BzTpFeq+Glmp7UDkkRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jOpQChbady85VjphGfbgQ0josSjOZ9BtFVZ3HbNMAFc=; b=S9lE+Q/WHsUFYMA2Nj/c+KuNW7
 /AeVJzN41KSRtqiudclv1EujAv7bjqXLLZYTeMDS1m1bGrAqVMGhx747WJH3Idq/rPPl4NkbPEr5v
 lRMkrwejqeWZKySovmOLjgJ5+dZP4odeM0W4Q2tMBFxjJ+aGIzo6kmXUEZm+QMXyqpeg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t81C7-0004Uu-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 17:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EB5EA431F6;
 Mon,  4 Nov 2024 17:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1421C4CECE;
 Mon,  4 Nov 2024 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730742520;
 bh=kyMZ9fV6X+51trgRY65w1AUDjMP2XEnEX7GkvQFyuQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RG0ZZ45eSLTeSuURvGHB3h65F9t7QbkI04hRi4PIn9RQya+KVuOq+cKYwcM7OIRag
 ftffa9p0RPzhxKxbKbO1phJPPDnrPKDiu3Z4Itvr9Wls0R3DzSPdYDwIWB6GC4b2Kn
 OEWSQb/cisXjv+NDzmcx6uuXNdVsmOSyH1jBzLk86RwIVvV7yoI0yJMI8N5O1tLxWZ
 sqPAibypRsiDduXZx2vz4SdLoEWaYuAYo/l7nO/C5PoaF6LQixrBB1eQNUAosrKHye
 /gCeCfoWgbjXS3QMM1TfccoGnuhihV/zkZVDdun5Dof7x1e0ZdWeQe1z6JZskIC3qV
 2uU8b6EJ5uv3w==
Date: Mon, 4 Nov 2024 17:48:39 +0000
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20241104174839.GA1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-16-ebiggers@kernel.org>
 <20241104155900.GH21832@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104155900.GH21832@frogsfrogsfrogs>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 04, 2024 at 07:59:00AM -0800, Darrick J. Wong
 wrote: > Hmm. Looking at your git branch (which was quite helpful to link
 to!) I > think for XFS we don't need to change the crc32c() calls, a [...]
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t81C7-0004Uu-T1
Subject: Re: [f2fs-dev] [PATCH v3 15/18] ext4: switch to using the crc32c
 library
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 04, 2024 at 07:59:00AM -0800, Darrick J. Wong wrote:
> Hmm.  Looking at your git branch (which was quite helpful to link to!) I
> think for XFS we don't need to change the crc32c() calls, and the only
> porting work that needs to be done is mirroring this Kconfig change?
> And that doesn't even need to be done until someone wants to get rid of
> CONFIG_LIBCRC32C, right?

That's correct, no porting work is required now.  'select LIBCRC32C' should be
replaced with 'select CRC32', but that can be done later.

> > @@ -3278,15 +3263,11 @@ extern void ext4_group_desc_csum_set(struct super_block *sb, __u32 group,
> >  extern int ext4_register_li_request(struct super_block *sb,
> >  				    ext4_group_t first_not_zeroed);
> >  
> >  static inline int ext4_has_metadata_csum(struct super_block *sb)
> >  {
> > -	WARN_ON_ONCE(ext4_has_feature_metadata_csum(sb) &&
> > -		     !EXT4_SB(sb)->s_chksum_driver);
> > -
> > -	return ext4_has_feature_metadata_csum(sb) &&
> > -	       (EXT4_SB(sb)->s_chksum_driver != NULL);
> > +	return ext4_has_feature_metadata_csum(sb);
> >  }
> 
> Nit: Someone might want to
> s/ext4_has_metadata_csum/ext4_has_feature_metadata_csum/ here to get rid
> of the confusingly named trivial helper.
> 

Yes, that should be done as a follow-up patch.

> Otherwise this logic looks ok to me, so
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D

Thanks,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
