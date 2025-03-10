Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 399C3A5A455
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 21:03:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trjLj-0006iF-UN;
	Mon, 10 Mar 2025 20:03:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trjLi-0006i0-Bc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 20:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uakVQJCzySOCijcVMdsByC12sKBD/ugHJsyA4B8eqjg=; b=GaLe6T4SldHbKsC2xypcYFsLQc
 KqOxlJSwYzmICiYL1pijgzjx8uRN8JBXFw2Aq0l9Ify2NNIn0wasyw5k4gS5GiJ753KXNVyB1Znrn
 UjmkqQVDVbWRi5DkQtzRY5FlU7+R/m1DV1Kn+JZ7AupXBSEXTszXuDcVm4fidaKB5Ca4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uakVQJCzySOCijcVMdsByC12sKBD/ugHJsyA4B8eqjg=; b=SVSZScquh/SA0TLjqbqc33O8Ox
 QZq/yg7JmQ3i/Wcu97dEsZASJNKPh1Pvcv1tUZM9RKvjCTBXcbc0eBA+BrpzoIohTx7vG5B4HOPib
 1iKZBzTP+IgoMuVk3CXrnC70ZB/nIRjT7jTmVaKpThhdZrgkYiVu/QGX3EP5EozLKeE0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trjLi-0008HU-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 20:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741637010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uakVQJCzySOCijcVMdsByC12sKBD/ugHJsyA4B8eqjg=;
 b=XYn+/jzJCrwrXT+kyovFRGjsJJ1ryWzXhyVS/4CGh5PexF4hz63dS1x8IPGCCHSh1MDzwo
 5MhpKNHADgelNlYqiZvslq1DtrhGk5iqhAZ8CQCKDHO/dL3W3gZytJmz+ZMb7qQpvL891J
 CRhH7iFfFUHcXiLgVcDeNJ/NdFwaQXs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-823RAm2KNwuKch67yBNzJQ-1; Mon, 10 Mar 2025 16:03:29 -0400
X-MC-Unique: 823RAm2KNwuKch67yBNzJQ-1
X-Mimecast-MFC-AGG-ID: 823RAm2KNwuKch67yBNzJQ_1741637009
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2242ca2a4a5so42108335ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 13:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741637008; x=1742241808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uakVQJCzySOCijcVMdsByC12sKBD/ugHJsyA4B8eqjg=;
 b=l5Z649rcN4neIPYN8dNrnTgeLhZi/0BbKoeFp8u0MFJpzJVjxw1xdmwk7UQd2AsIWL
 iYi856xz/QBK/vTPeQiII1B2qz64F3JP8YAo4xpvF6CRnpcZqQw2/sADAAXJ74ML2EOB
 YnzObEO30rP80OulCawrw4VqGokto9uaNFhjqm25l8OjYhE48Sz0UxM+7JhBrAxsQ9h0
 JxxjmeBMKQFrUu0CB57tbL7+E+c0gyTxXoh1SBE7NhVloWv7s9ffwrjISwUwahCBbBMN
 jpk5NiAmFpBhQa7NMKMOVI20MyNCTJji8oGAk+N+Htwm/WHDA5sMvd6xeYwmkgdemrxg
 1hPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuWbuj0PuWshlL6MUv5l06Sd6Bsam0QCMievHL3lIxGC7pXCzKSSkB+wtR4ywcBS771IfcTAlCK3wc+MAfvvQo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzfP1rU4ZKQWR0lEwoTXAcNBIuG8d8Xra0kSdNTjhyAVq+D4n70
 FwKSSPD8Txd4rMco9Uy06aym7NhC4xI378quLnp0Hm1EtFCcgxKWm0eP775aVbTlld2faDJ8DdN
 9f/LEqUiRNkPHqYKB7FW8drymcm6nGK+mBymgjhziwp8O1AIefcYWGCJAqug291r6g5HfdF9w2F
 ImLwh0mA79Eg==
X-Gm-Gg: ASbGncuxXAMmOnns/UJVLkvTUws2KATzqDsdtz5f3/CQBnbLFf4GwQtP2e8Lh1geLFn
 TbzsEG7sHedlHot/FzkrJO0PZt2AvTKbpVFT20S7FqpOnuLnh/xv/vQvUeJbxIo/HOD3rHEoYFx
 HMsGslg+FdTAveqhH/zVcQ3/Jm8NDVgm0eg8t34bFm0qflR0hqbzIPrpFV8XeNwJVZ23Ozg2YZu
 NMSrVhrUb5X+N+AOnIdVcK/glc3r6cHR+RPGLw90OUKEiM5mnRG+IM2hbSfSk51lW8VQoE/VhJj
 Gd1UkOIh77EsSmHZDUe3/0oCZ0p3pOwuIVUV8vNoRZmzoN9uMtICcYjn
X-Received: by 2002:a17:903:32c6:b0:224:13c0:58e3 with SMTP id
 d9443c01a7336-22428bf1976mr198870405ad.51.1741637008523; 
 Mon, 10 Mar 2025 13:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHdP3lhkvO4vv1v0uqKE6VKOKrmQ5TN8oJrfPJ8ZypUYZSMUOGOmUKXlyfH5/KX2KJQg/5Cw==
X-Received: by 2002:a17:903:32c6:b0:224:13c0:58e3 with SMTP id
 d9443c01a7336-22428bf1976mr198870135ad.51.1741637008095; 
 Mon, 10 Mar 2025 13:03:28 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa5eedsm82871265ad.236.2025.03.10.13.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:03:27 -0700 (PDT)
Date: Tue, 11 Mar 2025 04:03:23 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250310200323.fl647x67kxe6r7xe@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250310115621.3441518-1-chao@kernel.org>
 <20250310115621.3441518-4-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250310115621.3441518-4-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qlnqbuthokBx0l8QFRmVAo4m2zTPg21ofreF6P7T3pw_1741637009
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 10, 2025 at 07:56:21PM +0800, Chao Yu wrote: >
 This is a regression test to check whether fsck can handle corrupted > nlinks
 correctly, it uses inject.f2fs to inject nlinks w/ wrong value, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trjLi-0008HU-A6
Subject: Re: [f2fs-dev] [PATCH v2 4/4] f2fs/009: detect and repair nlink
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

On Mon, Mar 10, 2025 at 07:56:21PM +0800, Chao Yu wrote:
> This is a regression test to check whether fsck can handle corrupted
> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
> and expects fsck.f2fs can detect such corruption and do the repair.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - make _scratch_mkfs() to format f2fs image forcely
> - adjust _check_scratch_fs() to allow specified parameter of f2fs
> - add _fixed_by_git_commit
> - add _require_command inject.f2fs
> - simply return value handling
>  common/rc          |   9 ++-
>  tests/f2fs/009     | 133 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/009.out |   2 +
>  3 files changed, 143 insertions(+), 1 deletion(-)
>  create mode 100755 tests/f2fs/009
>  create mode 100644 tests/f2fs/009.out
> 
> diff --git a/common/rc b/common/rc
> index bf24da4e..e156f3af 100644
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
> @@ -3682,6 +3682,13 @@ _check_scratch_fs()
>      ubifs)
>  	# there is no fsck program for ubifs yet
>  	;;
> +    f2fs)
> +        if [ "$FSCK_OPTIONS" == "--dry-run" ]; then
> +            fsck -t $FSTYP $device -- $FSCK_OPTIONS >> $seqres.full 2>&1
> +        else
> +            _check_generic_filesystem $device
> +        fi

If the "--dry-run" of fsck.f2fs is similar with "-n -y" of fsck.ext4. Then
you might need to change the fsck_opts() function in common/config.

  _fsck_opts()
  {
        case $FSTYP in
        ext2|ext3|ext4)
                export FSCK_OPTIONS="-nf"
                ;;
        reiser*)
                export FSCK_OPTIONS="--yes"
                ;;
        f2fs)
                export FSCK_OPTIONS=""
                ;;
	...
  }

The default FSCK_OPTIONS for f2fs should be "--dry-run".
        f2fs)
                export FSCK_OPTIONS="--dry-run"

Then ...

[snip]

> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
> +		>> $seqres.full || _fail "fail to inject"
> +
> +	export FSCK_OPTIONS="--dry-run"

... then you can save this export FSCK_OPTIONS="--dry-run". I've explained
more in your v1 patch review, refer to:

https://lore.kernel.org/fstests/20250310194818.wki325qreuta26nc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/T/#u

Thanks,
Zorro

> +	_check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
> +	_repair_scratch_fs >> $seqres.full
> +	_check_scratch_fs
> +
> +	_scratch_mount
> +	_scratch_unmount
> +done
> +
> +echo "Silence is golden"
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
> new file mode 100644
> index 00000000..7e977155
> --- /dev/null
> +++ b/tests/f2fs/009.out
> @@ -0,0 +1,2 @@
> +QA output created by 009
> +Silence is golden
> -- 
> 2.48.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
