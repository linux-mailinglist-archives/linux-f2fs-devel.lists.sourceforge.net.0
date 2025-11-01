Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D120C27CEC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 12:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow7ZugQ67RycDdpihWyBNn2KSX99ws/xZ2//rjLOQvI=; b=SMLwcyzFapHC3L6dq5NxHY6Jvg
	0wfNl+RHIkA0AM2E0/YnjGNNMzgJ3Pzwll8TkbEMbfAqL3Z++zyBRJ33FDhfobhZ7+GzR/sNLmjEf
	wX/za7xLbHnx3S96+KaNzgEqQ//NsI5fMs3ZlSSKbu17aWrRRmgxQdfD4Y1s/bUd0yeI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFA2f-0005MX-Uw;
	Sat, 01 Nov 2025 11:45:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vFA2e-0005MM-J4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 11:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nzrmyqn1nI6uNvGQvj9+cgm3Z1yHYj1tZgxbuYwykP4=; b=PmTPDP+tJZxzVjH7YW+p6oUKRW
 /yaNl4uYvNk4CxYsWnsAY2BwQbZNaHEEx5Ytn+O2Ac0Ie1Qh0LjY59UIk5o/nSK+stsh5D5xkTFrU
 /BfBA7hMMzPF+ucEfHACgMTv4pUbMRWDvLxyCdUHCWRw6GEYdkO6O/AmZ++SLKjG2nLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nzrmyqn1nI6uNvGQvj9+cgm3Z1yHYj1tZgxbuYwykP4=; b=DEWYIvqjlr7czsdaRaEMhWXPCt
 lZEXNMCjUsCVxRpKiIV1BLp0eUvZ5FhieEhpj/D6Bc5F81mY+WX02w2jP0Qf+gIqkt383X3/AUbuT
 YJKAdElenFSpjVedC+sVH62Bf1JdkIWBTVSbp8zJZJGDT0zwBdQVFQCwMhqhNLZoesDI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFA2e-0005uH-QJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 11:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761997502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nzrmyqn1nI6uNvGQvj9+cgm3Z1yHYj1tZgxbuYwykP4=;
 b=HGn9NImYdIGpRNI8Wg6sx/OGNHHtwDyMV+O79ilzRAMMp9PJI+wD7e3o3iHKgRB5v326Cl
 E2TxRVKsqxmRl1pSw7g0+aZchcb2uGMxcRULnbdzd+ILAKqfB2yy0QZM3fcvzeVTjN8X84
 1fqzOrF36e+ZIJJyPmGHyTJuJrfpUVY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-3Wt9ctZFOIuHbX4AXD0qog-1; Sat, 01 Nov 2025 07:45:00 -0400
X-MC-Unique: 3Wt9ctZFOIuHbX4AXD0qog-1
X-Mimecast-MFC-AGG-ID: 3Wt9ctZFOIuHbX4AXD0qog_1761997500
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a27ade1e73so3226677b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 04:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761997499; x=1762602299;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nzrmyqn1nI6uNvGQvj9+cgm3Z1yHYj1tZgxbuYwykP4=;
 b=YzHRsBZr7tcfNW1891Gg+ciK2Xyts9UWcA6TvpwiVnQn01+ZbGcU7wY+ptbjg+flS8
 z5U8gCrZdPUMTDZsLYy1yYPKg7AI7rQNsBvnkmKqpd0e/IrX+AxOgvxUgdfYOqvrmCgD
 dVXAES5oBeXywuJZ6eBqt1+A9Wo0J0hrfP2TW8CykacNQL23O1F/DqQHmbbRc/YSeVNz
 5CdqzRWvYJXF7bHWg74s6NFMjvB1BRT4javf2PfMi9Q9PO5j15n3iUVo4IAxq6EvxGjZ
 xJfhEeA/npON7lsgbt7ef+xfQhc4/rxZxehTI23Y/0tldyuCj4PBB1LftLNgBzCbFLsp
 TQyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Bn5m6iRsEA9AhX7jHhV/jgOGb39sN8CurabkA3lMOSe4iUZtW1JOtGsQm0bsQURMl/X0imPjYegYxhledgJX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwAvM63Zwu+Ln8ZeFDgD5ZsKqrRFxq/JVKoU+NLJHHuRz0VQCt0
 mDYBmNu8TXjnHDY1VBQDzD8rqfSXsxR4PmIl1NylrAOt8JaeD8eAjyYjlOalHkWcH4Iw/l5fFWE
 DTyTzAbvk7O9TYA52M6f8cs4CSYKtQlVxfLuwg2ZNJCDLjX9v5C/RnTb1rxjyn13xoDMXVA7iRc
 +8F/k=
X-Gm-Gg: ASbGnct2QnNUA+smppBEoxJQyNscIA9sooRV/Z0/tOOw8rm1iBYwMm3u4Z9peqHZlDw
 RS3bVzRv6HpVWkLxNwB5/7ewAT9E49p32KZG/ZMwx1anOBj3sFO0mMGJjog0YQdtWBkFbW2YPYb
 Kv3d0wpZ1VhRFQJapW6kGO6jzHE6X9k+VE5OU1VUKrsKoWB2UCaUBtm46b6LeDZ3uoJnhjTFHEW
 tywVgq+qhRIkGriq72QLlzTjGQia9VUdK0quZebfD85LTUphEohw4kOn6IIbHiDk41qtkDtmNAF
 qo8Rt6R8C2P6P1APc+FSZYjTv7hweXEUiZC5LlvBzkm79jCiMiiXlqkRpPpUWG8xV5PRykFJ7Mn
 HU/k9wlPOehpt+JyhwaJTNrUxHrqryD8luq0uHvQ=
X-Received: by 2002:a05:6a00:94d5:b0:781:1cc0:d0ce with SMTP id
 d2e1a72fcca58-7a778fde6admr7949810b3a.16.1761997499562; 
 Sat, 01 Nov 2025 04:44:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt3t3fILpedWMF3In6I/dloHs0p7vCAoOXOnw4OeJ3kdTZLzsy0qIzhKVTRadsKVjYZDbSNA==
X-Received: by 2002:a05:6a00:94d5:b0:781:1cc0:d0ce with SMTP id
 d2e1a72fcca58-7a778fde6admr7949786b3a.16.1761997499072; 
 Sat, 01 Nov 2025 04:44:59 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a9bad978c4sm336030b3a.13.2025.11.01.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 04:44:58 -0700 (PDT)
Date: Sat, 1 Nov 2025 19:44:53 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251101114453.g6fxupmriauxtroc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251020023108.327728-1-chao@kernel.org>
 <20251020023108.327728-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251020023108.327728-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P7XfkQFwzH6U7V8x_hAn-JoZech3jDmC3lIivCYkqo0_1761997500
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 20, 2025 at 10:31:08AM +0800, Chao Yu wrote: >
 f2fs/022 will report failure as below: > > f2fs/022 - output mismatch (see
 /share/git/fstests/results//f2fs/022.out.bad) > --- tests/f2fs/022 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFA2e-0005uH-QJ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/022: fix to run testcase correctly
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

On Mon, Oct 20, 2025 at 10:31:08AM +0800, Chao Yu wrote:
> f2fs/022 will report failure as below:
> 
> f2fs/022       - output mismatch (see /share/git/fstests/results//f2fs/022.out.bad)
>     --- tests/f2fs/022.out      2025-10-20 10:18:47.075968669 +0800
>     +++ /share/git/fstests/results//f2fs/022.out.bad    2025-10-20 10:25:20.000000000 +0800
>     @@ -1,2 +1,5 @@
>      QA output created by 022
>     +wrote 8388608/8388608 bytes at offset 0
>     +8 MiB, 2048 ops; 0.0018 sec (4.300 GiB/sec and 1127132.6362 ops/sec)
>     +fallocate: Operation not supported
>      Silence is golden
>     ...
>     (Run 'diff -u /share/git/fstests/tests/f2fs/022.out /share/git/fstests/results//f2fs/022.out.bad'  to see the entire diff)
> 
> HINT: You _MAY_ be missing kernel fix:
>       xxxxxxxxxxxx f2fs: fix to do sanity check on node footer for non inode dnode
> 
> Fix this testcase as below:
> 
> - fix a typo "$SCARTCH_MNT"
> - fix to update output to "fallocate: Structure needs cleaning"
> - relocate output of "$XFS_IO_PROG $foo_path -c "pwrite 0 8M"" to
> $seqres.full
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/022     | 8 +++-----
>  tests/f2fs/022.out | 2 +-
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> index f6d77c96..728ef4e8 100755
> --- a/tests/f2fs/022
> +++ b/tests/f2fs/022
> @@ -24,15 +24,15 @@ _require_inject_f2fs_command node i_nid
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
>  
> -foo_path=$SCARTCH_MNT/foo
> -bar_path=$SCARTCH_MNT/bar
> +foo_path=$SCRATCH_MNT/foo
> +bar_path=$SCRATCH_MNT/bar

Hahaha, I took long time to find out what these 2 lines try to change:) Thanks
for fixing this.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  
>  _scratch_mkfs >> $seqres.full
>  _scratch_mount
>  
>  touch $foo_path
>  touch $bar_path
> -$XFS_IO_PROG $foo_path -c "pwrite 0 8M"
> +$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
>  sync
>  foo_ino=`stat -c '%i' $foo_path`
>  bar_ino=`stat -c '%i' $bar_path`
> @@ -48,7 +48,5 @@ _scratch_mount
>  $XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
>  _scratch_unmount
>  
> -echo "Silence is golden"
> -
>  status=0
>  exit
> diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
> index 394c6a7c..5307e3d7 100644
> --- a/tests/f2fs/022.out
> +++ b/tests/f2fs/022.out
> @@ -1,2 +1,2 @@
>  QA output created by 022
> -Silence is golden
> +fallocate: Structure needs cleaning
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
