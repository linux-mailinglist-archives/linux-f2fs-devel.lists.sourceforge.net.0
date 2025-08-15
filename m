Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6CB28353
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 17:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXkxNNJWM7RPy77DRIYldQ9HXjJHgFfNjQ9xDH/306o=; b=bEt7r0YFapUu49XrOTiEykyTOf
	OBGIwl/IRNN1UeKtxJ0FDChYXkTna6jrJ4MAnYwD3lzO7H/7sPh0tgKoYWDFdFoEjxHOMUx+n+MPf
	aCS6HQhDQONqN6DubyippZcE3ipg27c8zBgFvT3AsBo4KGqBTFtZjAGn06OO0W7sF6Xg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umwlA-0007An-HN;
	Fri, 15 Aug 2025 15:54:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umwl9-0007Ag-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NRaMgkMEgLgN4mQUMby7xLO7l22leF6759j8hvQ68v0=; b=lTZ8kYNhlAyX2fX4mfg5pTmn/u
 vNYiBQkLYOgLHfNqNHqIF/xrQ9F15zca2pjyJUFFxZv+dcIGPSoFtCznBYDXjIqVCzdeVJdwUm6jP
 4gcN+uTuX8VNvJchXAPO9PNv6vUpGyCdniMyEYj13AP0ORgZn5Eq/GN9BdjZT1VOGn0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRaMgkMEgLgN4mQUMby7xLO7l22leF6759j8hvQ68v0=; b=G7JnQwdZSRQ/0PniLuc0YNWuGw
 kBXJdaxY3tlcSdqtKmTcw5aRMpJ2X+licr2l08+tbnoHIOVfwECnhbOjwNl+YxcMzfEyKy03SYW9f
 Xq+8GZ2tNiTcQ37mPH5oZ1DoJQiJu2ivVBhJWhFli4skq4N4fll7hUkoRiL3JXaELM8g=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umwl8-0006vN-Ve for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 15:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755273255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NRaMgkMEgLgN4mQUMby7xLO7l22leF6759j8hvQ68v0=;
 b=LKuikM8CH8dZ3g92fKiz9XFu73NHsLVGsg3RDiD8Yig5Q1L0NU72E9s3GNip2CDXQJc8dO
 Sdpumf/OsJSoQ0ee6Sg0hLgbGxk1GOdjOteUa/pY9AgGs3QBE+vTJHwL+grQS06LLuG4a5
 vfelkHaVmLZR4QbJ9jamwp4TN4dLlyE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-kbB_YE-xOvSX6PIFRyjlFQ-1; Fri, 15 Aug 2025 11:54:14 -0400
X-MC-Unique: kbB_YE-xOvSX6PIFRyjlFQ-1
X-Mimecast-MFC-AGG-ID: kbB_YE-xOvSX6PIFRyjlFQ_1755273253
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e1fc66de5so2697041b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755273253; x=1755878053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRaMgkMEgLgN4mQUMby7xLO7l22leF6759j8hvQ68v0=;
 b=i6+0M0X8cG3aYl3sEkKDzwIlyzthqtyrrtglPDzENuVch7brz1imYVlx+fp0u2hNU3
 d3ULwV4egzeIbBuiN87pnhrGFTUE3iK/aWhRXklsPKfkt9oEZ5aIe51fEWL8TCEN+3Pe
 p6rpFlGvLbehvD3Iw3ykTkKwoJdCmPUKMBCDjj8CqkcXSv1XtH/7JhN1dMQ9iQbGCN9E
 /PJ8oc3FYTVHUXw0oJH++dSDghZrAIA12WSc1oGZX38JAjTUsbWoikGGYAcd5m2eqSL4
 pPysKFgg5v3g2MajQmsu2DqMqxRM2N/kjwE+WZH2WErPfFEDYbBwfp7S6LOrRC4jV7Pb
 hjLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdrEc5WGxRJG5SCK1T68OZdGDEqXXcOcvJ8yFjyLtCAZKexprl9oSQEyDTNouqOI2vxLzzYV3ZGnHDA8R6EF3e@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yybg+txVTkHDF5d13hxwnwSa+sQsXi84ZIYC6AhLd5IWjc6k1y8
 JsSWZtP2AZrS4yI4+j5Qirq9qOvvKfIDXl9Ak0QCMRmC6z/BRBPHyYgvygJuApOSdhsc7HE4qBl
 t79uW7yywkl2GnDQFkET+WleL0vjUOjbehGOQfromY8Qe4QzVvCL2NJexGLctP/HEqiL0yK7RKs
 cTpfQ=
X-Gm-Gg: ASbGncsh1aGve0qcS7TnqL8zBuXf23zGTGLcUZ2EdykjqJAKlE/35sRPz/5InmtVodZ
 57hkG+SkNySxHpjdlhpE7lVx9p7V/15FW1gK62b79QNPPP6XRQIcXDvd79piwwHaQHLgCHRTHZv
 qK3WYHku4aDhcTX0ei28/v+MN40wlErnMEC/mZSIbdlOUl9jAOZ8QG6N7l6QEdiTHjd4/DWvccr
 urxkW2CeZTnRfp/ZfdkWmAVKyO1NaHe4FWSk9ikJTii7gz0DGYIZ2a1BijvcLM51h8Nb5BSO/cJ
 20mKak2MK4aI8QGrtEBWpGD9b3lqCu7JGOXk520UCln6NiUpFNkBqFzQjkhB6HFnKPB3F6XLVgH
 pGJRI
X-Received: by 2002:a05:6a00:2344:b0:76b:cc37:d4c5 with SMTP id
 d2e1a72fcca58-76e43830aebmr4116952b3a.5.1755273253372; 
 Fri, 15 Aug 2025 08:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVyz6fnoqKB51muPU4YuSBCAeUdAuoOcJyxwicsXPL6yhVmU/S9648a/DV3cU8AIDA8Bd9Uw==
X-Received: by 2002:a05:6a00:2344:b0:76b:cc37:d4c5 with SMTP id
 d2e1a72fcca58-76e43830aebmr4116930b3a.5.1755273252964; 
 Fri, 15 Aug 2025 08:54:12 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e45292dc1sm1394626b3a.50.2025.08.15.08.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 08:54:12 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:54:08 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815155408.ja527chpfrjtcuau@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250808065803.17298-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250808065803.17298-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rEKsw_5fS1D7q_invOGN18HptEqtwwDtmMl89VkHUvw_1755273253
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 08, 2025 at 02:58:03PM +0800, Chao Yu wrote: >
 w/ below change [1], f2fs will enable lookup_mode=perf by default, it > will
 change f2fs dirent lookup method from linear based lookup to has [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umwl8-0006vN-Ve
Subject: Re: [f2fs-dev] [PATCH] f2fs/012: adapt lookup_mode=x mount option
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 08, 2025 at 02:58:03PM +0800, Chao Yu wrote:
> w/ below change [1], f2fs will enable lookup_mode=perf by default, it
> will change f2fs dirent lookup method from linear based lookup to hash
> based lookup.
> 
> So that, f2fs will ignore sb.s_encoding_flags by default, which is not
> compatible w/ f2fs/012 testcase, in where it will control lookup method
> by configuring this flag w/ fsck.f2fs.
> 
> To avoid failure of f2fs/012, let's check whether f2fs has supported
> "lookup_mode=auto" mount option, mount w/ the option if it can,
> otherwise, don't.
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20250805065228.1473089-1-chullee@google.com
> 
> Cc: Daniel Lee <chullee@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

With this patch, I always get below error:

f2fs/012 2s ... - output mismatch (see /root/git/xfstests/results//f2fs/012.out.bad)
    --- tests/f2fs/012.out      2025-07-21 13:33:12.379585206 +0800
    +++ /root/git/xfstests/results//f2fs/012.out.bad    2025-08-15 23:51:54.156835560 +0800
    @@ -1,2 +1,4 @@
     QA output created by 012
    +mount: /mnt/scratch: wrong fs type, bad option, bad superblock on /dev/sda6, missing codepage or helper program, or other error.
    +       dmesg(1) may have more information after failed mount system call.
     Silence is golden
    ...
    (Run 'diff -u /root/git/xfstests/tests/f2fs/012.out /root/git/xfstests/results//f2fs/012.out.bad'  to see the entire diff)

Then test passed without this patch:

f2fs/012 2s ...  3s
Ran: f2fs/012
Passed all 1 tests


>  tests/f2fs/012 | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/f2fs/012 b/tests/f2fs/012
> index b3df9a8f..15fc8f0c 100755
> --- a/tests/f2fs/012
> +++ b/tests/f2fs/012
> @@ -22,6 +22,15 @@ _require_scratch_nocheck
>  _require_command "$F2FS_IO_PROG" f2fs_io
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
>  
> +#check whether f2fs supports "lookup_mode=x" mount option
> +mntopt=""
> +_scratch_mkfs -O casefold -C utf8 >> $seqres.full
> +_try_scratch_mount "-o lookup_mode=auto"
> +if [ $? == 0 ]; then
> +	mntopt="-o lookup_mode=auto"
> +	_scratch_unmount
> +fi
> +
>  check_lookup()
>  {
>  	local nolinear_lookup=$1
> @@ -30,7 +39,7 @@ check_lookup()
>  	local redheart=$dir/$'\u2764\ufe0f'
>  
>  	_scratch_mkfs -O casefold -C utf8 >> $seqres.full
> -	_scratch_mount
> +	_scratch_mount $mntopt
>  
>  	mkdir $dir
>  	$F2FS_IO_PROG setflags casefold $dir >> $seqres.full
> @@ -52,7 +61,7 @@ check_lookup()
>  
>  	$F2FS_INJECT_PROG --dent --mb d_hash --nid $ino --val 0x9a2ea068 $SCRATCH_DEV >> $seqres.full
>  
> -	_scratch_mount
> +	_scratch_mount $mntopt
>  	if [ $nolinear_lookup == "1" ]; then
>  		[ -f $redheart ] && _fail "red heart file should not exist"
>  	else
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
