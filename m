Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9EA5C356
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 15:11:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts0K5-0001s7-RW;
	Tue, 11 Mar 2025 14:11:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1ts0K4-0001ru-Bg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkvND+eYHH9qsacQ7rfWb/ck3Os9E/r1JZIjq4LYTVM=; b=SjuApCGPTuHdnztNL+yJcdJGZB
 64id+g10FFPikIP4IvnGLakVMAj07WcnR2Y2PPsrOPWb2bqPtJ6qNc8dfG74wrctYZgaiDhHJ77fo
 RdppTUw5U4md/UEI3jBYEjqpavyIgZc5GunGt3P0mFmkS/so3W5oOiDFEu4yJPJTfn9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SkvND+eYHH9qsacQ7rfWb/ck3Os9E/r1JZIjq4LYTVM=; b=fK2fj0Jqle8LhfdwrCFETnY9w4
 MXfGkwjyfZ6zvIv3uYKxd+XkGd5aoXEeEq5KE1g12BeLUEsuOyCkZPLNdELUGQDJTlen//VgOfncD
 9sm1SfNIUnouPJ7DNUWCOTIseeKiRa+cELaR3wr69Kw9T/iP1Yn6hHIDGJm7rcBlvGEY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts0Jz-00062L-Ex for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741702257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SkvND+eYHH9qsacQ7rfWb/ck3Os9E/r1JZIjq4LYTVM=;
 b=JE4LpVlx9PiD7dDjPMTD2uI/BMLuO2l91vwbsaOESmpZ+/U8aD2KYJ04i22MIE32Od5IR3
 FXYQRb0SsPy+s3XPFWcslddfqtZ05G+mX3oCjCxm2OwWWkyETfA9y1WheyTrs3wEOb1js4
 MbiT21dQeeo5+m5An0w11jt2qPwhSPM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-yrxifYo4Pkm3RfNhLtP01A-1; Tue, 11 Mar 2025 10:10:55 -0400
X-MC-Unique: yrxifYo4Pkm3RfNhLtP01A-1
X-Mimecast-MFC-AGG-ID: yrxifYo4Pkm3RfNhLtP01A_1741702253
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-225505d1ca5so47485595ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 07:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741702253; x=1742307053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkvND+eYHH9qsacQ7rfWb/ck3Os9E/r1JZIjq4LYTVM=;
 b=mCggmsW+c1qoKrKQEMGo3SCvb4bpHGbzY+qd+DGCbcLAGKPYRVKE6XIMtPOeWQzyBu
 2gtMCucryo3/HyPnOAEaY/9qeepdgh0EVIUn6QOG6bLustg8TU/lzZ8cPNijb7UkE07T
 OUYFNmzY1KTO9dt5waJlrymP/C5pK6rBuJZylOX+U3q1TSchhKwM3cCfIS8ZPCcyTjv/
 rdhGHM2+N02pdOHVhkUpv/RDn3x71E8VHtIGeYMzi4ei3CkBEeV+w/lS6Cwxfwei96Px
 YSavdI4TJVcujmLS1ZlInw+fez1h17OhpXB7bO0k23hHiRn63NO/uGNq/+s22j/GxoAS
 gfvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk6JBtbWOJ2NMOGH17HroeXO6w1Ggbz0sjZDUsTmVRLnUOJiNdC5Q6eGbYexv92FCjYW4Y2lkPV8FYXdjbSm17@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzolOwvRqARy3pf/7rTcIjTzUtBWmo2rib3xggUrL0j/+qDY/aL
 FSrFcIlOZQQHysmMh1/IMuVihFTq+DmFC8NEl61RQYM5C6YBp1dG8UGn7SCk9SxFJ7VDncUz4AH
 4SqD/bXbM+0FRpng+STQeCUA93rQC/ocNA2JS89evFT72ZHWDeqjDvnfsYm7Im/MK0PwWJdX8ww
 8=
X-Gm-Gg: ASbGnctipSG9ePnfUyiM9HcLFx/RLYyM50C76EXpBzdKZMW3BGoKSmWtA2GZ8E2tUqX
 Dti8isMZPxGFcjvVzRwzrZQWny8wmr2JwCD0JbHICzMSG8nXkqenZIZCkTMPFw1fvL5tIdddWhb
 GvUZjkQ+gfjZoS7b1Jat6Lts0qGCUsjKmsjFvHeMbCfwhnlmvu0fMnr+TwX+EC6irm0RkkHOTkn
 ErPkg/Rp5FFw0BpOu4rh5B8WhZcK9G6nImi2PnBQkQvYI7iocRkNEZ8tym7qYeXCkKYK3638KnY
 HAYuB7KE77zycxELmU8jhYjoDzV4aBbaY8Cx84AAPvlXJH5JcOelhCcN
X-Received: by 2002:a05:6a00:a09:b0:736:ab1d:83c4 with SMTP id
 d2e1a72fcca58-736eb65d07amr5709724b3a.0.1741702253336; 
 Tue, 11 Mar 2025 07:10:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGBAe6qYUv/1LSdx10iDSl+9jxSxX1nvqdNSscZ0FP3Zlo9UqY1wsdnnJeIUzm79j1aANS0w==
X-Received: by 2002:a05:6a00:a09:b0:736:ab1d:83c4 with SMTP id
 d2e1a72fcca58-736eb65d07amr5709685b3a.0.1741702253020; 
 Tue, 11 Mar 2025 07:10:53 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d8f0ea83sm4312868b3a.143.2025.03.11.07.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 07:10:51 -0700 (PDT)
Date: Tue, 11 Mar 2025 22:10:46 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250311141046.hpwurbjqc6dbwoml@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250311080430.3696582-1-chao@kernel.org>
 <20250311080430.3696582-4-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250311080430.3696582-4-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _rZfATgcS1jwnM8wgIoWR4zVEtuktEpy98V-Fw9Urwg_1741702253
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 11, 2025 at 04:04:28PM +0800, Chao Yu wrote: >
 Otherwise, mkfs will fail due to there is an existing filesystem > in the
 image. > > Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by: Ch [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts0Jz-00062L-Ex
Subject: Re: [f2fs-dev] [PATCH v3 4/6] common/rc: use -f for mkfs.f2fs by
 default
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 11, 2025 at 04:04:28PM +0800, Chao Yu wrote:
> Otherwise, mkfs will fail due to there is an existing filesystem
> in the image.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - split change from f2fs/009, and cover both _scratch_mkfs() and
> _try_scratch_mkfs_sized()

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/rc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/common/rc b/common/rc
> index ca755055..23b642f4 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -993,7 +993,7 @@ _scratch_mkfs()
>  		mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
>  		;;
>  	f2fs)
> -		mkfs_cmd="$MKFS_F2FS_PROG"
> +		mkfs_cmd="$MKFS_F2FS_PROG -f"
>  		mkfs_filter="cat"
>  		;;
>  	ocfs2)
> @@ -1336,7 +1336,7 @@ _try_scratch_mkfs_sized()
>  	f2fs)
>  		# mkfs.f2fs requires # of sectors as an input for the size
>  		local sector_size=`blockdev --getss $SCRATCH_DEV`
> -		$MKFS_F2FS_PROG $MKFS_OPTIONS "$@" $SCRATCH_DEV `expr $fssize / $sector_size`
> +		$MKFS_F2FS_PROG -f $MKFS_OPTIONS "$@" $SCRATCH_DEV `expr $fssize / $sector_size`
>  		;;
>  	tmpfs)
>  		local free_mem=`_free_memory_bytes`
> -- 
> 2.48.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
