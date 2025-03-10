Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790DA5A409
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 20:49:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trj7M-0006BX-RJ;
	Mon, 10 Mar 2025 19:48:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trj7H-0006BN-LO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 19:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AOVGRYhvRF8U399jZHygKPFd5tS2cIqbXc6OU6+8P3c=; b=WKUsQ1tUNvbrfXgi5AYUb45z8x
 z7p+qyx2odWb5MTvNQJrYjjeU6kkN2/pRIt7Ivprjsj6vDss/FyiRsTFTTYzJmSBOl3MX+Y6BAkB1
 DvShdyXSw5lH0xUg57RurQmaBxzyrjBsEQj2R95b9dZ8tiejqmvWxK25RJ+7yVhFrLCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AOVGRYhvRF8U399jZHygKPFd5tS2cIqbXc6OU6+8P3c=; b=RAZ2qGF9lLiHJNOr44oNQh85OS
 5CV41RQubHuq6WQuyidkc9ZgYLcLnd532QmnD4SmKwhqdaCI+5SmD3zoWitJeh9oV+ZvSVkW7rLLo
 6SoaJeNow30QO4gerfnunN62POJ15Gt1G793ZNSsZUXNfPPRpcilVSyYYwUl4toxCoL4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trj77-0006Bg-AS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 19:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741636106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AOVGRYhvRF8U399jZHygKPFd5tS2cIqbXc6OU6+8P3c=;
 b=TWCuQP5mAtK53EgxaBfIhu9SRTh7Mk3/ExkZhvJ7bAohSMzafvHPm06yZjneX/vpjIXQ57
 0b8P8L+PkUXNkrZYGy8RH30v0MbMZpB+xQMQd+WPZlR3THuvvkSeXtS1Ya3UsWBiQ6ABYG
 MiHpjQgzwsD4z9+50m9hG7dk+UeLk2s=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-t6jtPC1zMMOVdIBmhcrrpw-1; Mon, 10 Mar 2025 15:48:25 -0400
X-MC-Unique: t6jtPC1zMMOVdIBmhcrrpw-1
X-Mimecast-MFC-AGG-ID: t6jtPC1zMMOVdIBmhcrrpw_1741636104
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2242a6d5775so40169735ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 12:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741636104; x=1742240904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOVGRYhvRF8U399jZHygKPFd5tS2cIqbXc6OU6+8P3c=;
 b=K932hIHNjn4N9lee3Fnp6JJVWIYRK6KTYlDT1ZTQjEFrXY9BNnaTu/49o3S+mIjuLr
 Om6Iu30lbHSA7Aq5osuof2T3mqy2fdDjwHKaR4ahZ8qpx9VnboHdn8E3TjdEX7hM0vUQ
 4s8uHOynYDufuOtEK3wLXF/siYrw4sAnv0wsIFoitQqR/5aJiCLzo7rkFsbv1ejt/06p
 ceg/6Zmft5gNf87l5jzFDTEEmGCGhqbgeHakEoRrxqm9Knyo3+72qbJOnGu9zEHT47u3
 22A+aTPO8gj6fhEen9r8Dwi3tK7Ohx/IksO1Itd+RXZNANM9dwd3nwm3NIYhopvYyNDs
 pYhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhrlaGLTuU5JNm3PolAvTdPcqR7+8H3LRtggub6YvBGij/pTnqK2NGCCpGDdZj0u0iTGbs7QM/FxcJh/Os1fBj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJkPBY11xnZGKSrLsLb3GPefVzNAhiX8rKrywN/msoVAbY6QvR
 ChWiAvQdRpQnX8s6tA89AcOYgSj0ChDsGXdKthtRHXrX6xAI3QLVXLAPLTbGTCgN+AgpaSSNeEw
 Pqx/XwvWzXdTkUtP+XbILz3+48SbwND8vx5Q2M/mul6aavApddfzFjjg+W1zaNlXCLQscl6lbLQ
 o=
X-Gm-Gg: ASbGncvoYl7Gg2ZfVL1YiTMj3k8SfvfVHjYNDHhKQqK+fe+OWTK/Frep7GzFf3icDUm
 JXxVQEqjSjAWVb9MYDSPAKUWpjlet3FPHBMaGjC/jpnZrhfGl2Q6IU4LY+jO6iJ1Hdn6fnJqw+m
 lfTDx4whVJSD5/4IXZJc/jkEVLd+Th2eFyAwH34n75VA6Ipygl0v4vP3aU/66t5Um3KSO+v9LIe
 T5CCI//Gc+QlopElpt0hREHHzesaHeg6K8khOX4ZoOSS1+0bqKnxuVibQzzKa8SlweX1h9sa9OO
 DEcAK0FENKtdRyO1tBzzAuuQP2Gtm4dp0dZghXYpGVoP12bIJlbAQysX
X-Received: by 2002:a05:6a00:22d4:b0:730:99cb:7c32 with SMTP id
 d2e1a72fcca58-736eb7d9a50mr1501562b3a.7.1741636103920; 
 Mon, 10 Mar 2025 12:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfnUMoN0oZOYdg27N0V7GBO2uZwi/uwY/SVCkMZe9c/mXbgJsNGhdPHXrd8YJtfe4VVfRxVQ==
X-Received: by 2002:a05:6a00:22d4:b0:730:99cb:7c32 with SMTP id
 d2e1a72fcca58-736eb7d9a50mr1501541b3a.7.1741636103535; 
 Mon, 10 Mar 2025 12:48:23 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736db486f14sm2355811b3a.7.2025.03.10.12.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 12:48:23 -0700 (PDT)
Date: Tue, 11 Mar 2025 03:48:18 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250310194818.wki325qreuta26nc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
 <20250310080006.rkvoxu55fe3qlxmd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <c62943db-6169-462a-95a0-15fb2d5bc079@kernel.org>
MIME-Version: 1.0
In-Reply-To: <c62943db-6169-462a-95a0-15fb2d5bc079@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8KJ6S7Uq_VnMHM0WsdcZvViuHYQYsE_mURLvqJC9u5s_1741636104
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 10, 2025 at 05:59:23PM +0800, Chao Yu wrote: >
 On 3/10/25 16:00, Zorro Lang wrote: > > On Thu, Mar 06, 2025 at 04:18:09PM
 +0800, Chao Yu wrote: > >> This is a regression test to check whet [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trj77-0006Bg-AS
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs/009: detect and repair nlink
 corruption
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

On Mon, Mar 10, 2025 at 05:59:23PM +0800, Chao Yu wrote:
> On 3/10/25 16:00, Zorro Lang wrote:
> > On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote:
> >> This is a regression test to check whether fsck can handle corrupted
> >> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> >> and expects fsck.f2fs can detect such corruption and do the repair.
> >>
> >> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> > 

[snip]

> >> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
> >> +	if [ $? != 0 ]; then
> >> +		exit
> >> +	fi
> >> +
> >> +	export FSCK_OPTIONS="-f"
> > 
> > You've set below code in _repair_scratch_fs():
> > 
> >     f2fs)
> >         fsck -t $FSTYP -f $SCRATCH_DEV
> >         ;;
> > 
> > The FSCK_OPTIONS="-f" is useless.
> > 
> >> +	_repair_scratch_fs >> $seqres.full
> >> +	if [ $? != 1 ]; then
> > 
> > What does $?=1 mean? Does $?=1 mean finding corruption and fixed, $?=0 mean no corruption?
> 
> That's correct.
> 
> > 
> > If you want to detect there's a corruption, then fix it, then check if it's fixed. How about
> > calling _check_scratch_fs at first to get the corruption error you expect, then call
> > _repair_scratch_fs to fix it. Then call _check_scratch_fs to make sure the corruption is
> > fixed?
> > 
> > Something likes (just a rough example)
> > 
> > _check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
> 
> You mean this?
> 
> export FSCK_OPTIONS="--dry-run"
> _check_scratch_fs >>$seqres.full 2>&1 || _fail "can't find corruption"

No,

> 
> We need to export FSCK_OPTIONS w/ "--dry-run", otherwise _check_scratch_fs
> will be stuck once it detects corruption.

If so, you might need to give _check_scratch_fs (and _check_test_fs) a f2fs
specific handling. Due to _check_scratch_fs aims to do "check" only,
_repair_scratch_fs aims to do "repair", they have different target. When
we call _check_scratch_fs, we hope it reports pass or corruption then return,
neither "repair" nor "stuck". So if I understand correct, you might need:

_check_scratch_fs()
{
	case $FSTYP in
	...
	f2fs)
		FSCK_OPTIONS="--dry-run" _check_generic_filesystem $device
		;;
	...
}

Or you have any better way to do f2fs check :)

Thanks,
Zorro

> 
> > _repair_scratch_fs >> $seqres.full
> > _check_scratch_fs
> > 
> >> +		_fail "fsck can not detect and repair zero nlink corruption "$i
> >> +		exit
> >> +	fi
> >> +
> >> +	export FSCK_OPTIONS=""
> >> +	_check_scratch_fs >> $seqres.full
> > 
> > I think _check_scratch_fs outputs nothing if run passed, right?
> > 
> > _check_scratch_fs calls _check_generic_filesystem for f2fs, the FSCK_OPTIONS
> > is "null" by default, so above FSCK_OPTIONS="" is useless too.
> > 
> >> +	if [ $? != 0 ]; then
> >> +		_fail "fsck hasn't fixed nlink corruption "$i
> >> +		exit
> >> +	fi
> >> +
> >> +	_scratch_mount >> $seqres.full
> > 
> > ">> $seqres.full" isn't necessary.
> 
> Will update according to you comments, thanks a lot.
> 
> Thanks,
> 
> > 
> >> +	_scratch_unmount
> >> +done
> >> +
> >> +echo "Silence is golden"
> >> +
> >> +status=0
> >> +exit
> >> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
> >> new file mode 100644
> >> index 00000000..7e977155
> >> --- /dev/null
> >> +++ b/tests/f2fs/009.out
> >> @@ -0,0 +1,2 @@
> >> +QA output created by 009
> >> +Silence is golden
> >> -- 
> >> 2.48.1
> >>
> >>
> > 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
