Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8064D37D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 00:36:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5bIj-0004Yr-Ne;
	Wed, 14 Dec 2022 23:36:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1p5bIj-0004Yl-09
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 23:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sfUK4j3uPSy8USYGH1WaBKFFv+FcT9DPrt0X+dJMTPs=; b=fbs3zwLU6uMvuDC7q1nxuOWyrQ
 WjS8VcoPJlyJfU1X7OkEbR1UYgeqGTi0ECREjyiSZwAw1PY4LuYr9Ac3CMxarh7fGjev31ADvhT3u
 q9EtK26WjvehKweFp23pdRFr/qpA7Bzgu7/pqvM3fTaGk9+YbDUin2LDfugwgw3P3o34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sfUK4j3uPSy8USYGH1WaBKFFv+FcT9DPrt0X+dJMTPs=; b=aIDk6pBo2jHZvgUjJ9UjnDv0Lo
 q8E5w6jaNtEJewQaMNKD9IoP4cOpWd9l+jzldHj1ivwXzcr4q3BBsL4ylo3FEymA95q5rlUHj2iPH
 NzEQ+Zi631ic31+HcMshL1+5GSs/RG7vuIFYyHk0oC6vYjJBRVJETy19+fcVo7x2T67o=;
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p5bIa-00HJvb-LZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 23:36:36 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-40b40ff39f1so19110417b3.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Dec 2022 15:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sfUK4j3uPSy8USYGH1WaBKFFv+FcT9DPrt0X+dJMTPs=;
 b=cGHJXZ7+kyvGSVT2OxZJ+Jak0y2wfSb6LWPex+ngGJ8Tu3SIAg7xRRWfX1C2WHhhGL
 7Ry8iM8UO7Clz11UW7kHc5i2VR3RNt/SOyAXzXn9qWcmuRGRz3pSwbDeNUVToTat8oo6
 EJNqgHPLfZcPylGQ8uYwR5SamH1F51HUyj0mOwIWHc8yUc/a/usMejiDPfPBvvpe2gOc
 /B4BTGH6TJhwb+JOs6UXtePadcmVKAocK94oAl9pBXh5bdIAY6VkTorkgeOy4eIudSYp
 o0jMzhNkhgRAjCA+6PjoIIraN4O1TW0oNJ4bqsBzlyaQdWs0nU8lfoL5pasMX84NTPRF
 UWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfUK4j3uPSy8USYGH1WaBKFFv+FcT9DPrt0X+dJMTPs=;
 b=uaSeYtZre6bDdSnTEiKrLJcFgpbSO6kheveeG+aY7TItXML3m0oeqTmS/mr2PXS4Qk
 0edjalU4ZOEvdnda7czK3yoYQ0uoHfejbSDpsvQbuabswX/rFC8Dc6xzPrMR4hTT9Axb
 nKVGr6zyuP/nvbMNtLnwtK2AnT2XSonEBNhwFVub04+zVaAi4//JHSHLehOnzCUhltsD
 poM+ajndl7nH7lHEdyvE4tiWPtzeFjSoyUGRTYSGTxlD4xvPZHIO/9wbAGHjy2UFGksQ
 Hxyrj7jv0SpV6j0mKaFGbtJBUamCVwwvn5FaCcdr6nb2wq3VGPlqqPBjD0InjFucOGhg
 QXDw==
X-Gm-Message-State: ANoB5pkLYDODfHNh5zgjQLqoER6rGae781r0DDpJsm2aMurDbhzWN4ai
 8K+WQEi8MyZ8Pt1EXxJfgTv34xwX88qmPIp1
X-Google-Smtp-Source: AA0mqf7404FQ+x51OsOEaz7mEzZOPK6J+OFvmRUDGC16ye2topm2HL7s7i7K+EGGKyoECUiGW5VY+Q==
X-Received: by 2002:a05:6a20:3b01:b0:ac:2559:35f6 with SMTP id
 c1-20020a056a203b0100b000ac255935f6mr30989367pzh.28.1671059450001; 
 Wed, 14 Dec 2022 15:10:50 -0800 (PST)
Received: from dread.disaster.area (pa49-181-138-158.pa.nsw.optusnet.com.au.
 [49.181.138.158]) by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b00218fba260e2sm1870310pjb.43.2022.12.14.15.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 15:10:49 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1p5ati-008W7d-Nw; Thu, 15 Dec 2022 10:10:46 +1100
Date: Thu, 15 Dec 2022 10:10:46 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20221214231046.GB1971568@dread.disaster.area>
References: <20221214224304.145712-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214224304.145712-1-ebiggers@kernel.org>
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 14, 2022 at 02:43:00PM -0800, Eric Biggers wrote:
 > This series implements a few cleanups that have been suggested > in the
 thread "[RFC PATCH 00/11] fs-verity support for XFS" > (https:// [...] 
 Content analysis details:   (2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.176 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.176 listed in list.dnswl.org]
X-Headers-End: 1p5bIa-00HJvb-LZ
Subject: Re: [f2fs-dev] [PATCH 0/4] fsverity cleanups
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
Cc: linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 14, 2022 at 02:43:00PM -0800, Eric Biggers wrote:
> This series implements a few cleanups that have been suggested 
> in the thread "[RFC PATCH 00/11] fs-verity support for XFS"
> (https://lore.kernel.org/linux-fsdevel/20221213172935.680971-1-aalbersh@redhat.com/T/#u).
> 
> This applies to mainline (commit 93761c93e9da).
> 
> Eric Biggers (4):
>   fsverity: optimize fsverity_file_open() on non-verity files
>   fsverity: optimize fsverity_prepare_setattr() on non-verity files
>   fsverity: optimize fsverity_cleanup_inode() on non-verity files
>   fsverity: pass pos and size to ->write_merkle_tree_block
> 
>  fs/btrfs/verity.c        | 19 ++++-------
>  fs/ext4/verity.c         |  6 ++--
>  fs/f2fs/verity.c         |  6 ++--
>  fs/verity/enable.c       |  4 +--
>  fs/verity/open.c         | 46 ++++---------------------
>  include/linux/fsverity.h | 74 +++++++++++++++++++++++++++++++++-------
>  6 files changed, 84 insertions(+), 71 deletions(-)

The whole series looks fairly sane to me.

Acked-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
