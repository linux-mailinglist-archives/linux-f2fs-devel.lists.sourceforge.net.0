Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4ABEAA34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Oct 2025 18:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb/W7uqlvE5l11Xk5hXrpoPz/LTcpXc0XLZMFr/QZ6g=; b=LUSQCzrrfLqGa36iLOHNiINIle
	2vliHP+f504ory8lHXCS6cwQzoVrsmYBlIl3QT5yO5H+EO+vKIlj7vb+YhvCMI6oiRWdUFCFLLLpY
	p7TfKcPa4t+BMHCAd3IQ4NLy/64RDzNkulN3IeOXhd8KQ48NujHcOyhl2lBF/wqbAaFM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9nDa-0007Mx-8c;
	Fri, 17 Oct 2025 16:22:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v9nDY-0007Mk-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7YTcK3VR0j6mGW9Mh46yN8tByhSaOAS1LNU95/rjcUo=; b=S1W9EnJHGN/COtWceCgQZ6n/PH
 AHYqZ0G4zJUOILyMNsVed/Sy8eODseHARFphN4amU77L5Xbas6PELK/cwWfDxU7MonWv9CQlzS+ro
 kKE0W8t5eHr1XcmXnD4Q7uMrPAMK1Pu7aV98Pq99vtwy/4GYlGA8XwfwB15CyYtbI1wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7YTcK3VR0j6mGW9Mh46yN8tByhSaOAS1LNU95/rjcUo=; b=JRKEd1w+BbzdBGENmacm1TsI05
 MP6dwxn2u8DpoB6GqmSB8j7OP4Bb0kvP2lk6l26gFj+sS8mXJ7Q9qcHJQvtQB95wNlkUGoKtDty1s
 lJ/2AyeBjLESODyA0V2j0gUniXWoplpujl0TvkOBAXd48cfL+mxRYirlFOe6OHQsx8Ns=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9nDY-0001QQ-O8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760718126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YTcK3VR0j6mGW9Mh46yN8tByhSaOAS1LNU95/rjcUo=;
 b=J8NgNzu7a6OTz5fOX3uU5z0oDx98LX8BUKVcCPvg87RG1vAx/zcaCeJ362d2TuIndAi1ya
 r7jQK/+BwfA/0B3NKdJpADeHLIR4FvyUQUFsufL6/Em67mIr0oiaKBZekkqSyFqR3Z5tej
 DXUJd+lqT/dfbreOZZIwZ6DSfOSZj/8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-W6BU4670MSOj2sxJr1MXWw-1; Fri, 17 Oct 2025 12:22:04 -0400
X-MC-Unique: W6BU4670MSOj2sxJr1MXWw-1
X-Mimecast-MFC-AGG-ID: W6BU4670MSOj2sxJr1MXWw_1760718123
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b55443b4110so1726405a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Oct 2025 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760718122; x=1761322922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YTcK3VR0j6mGW9Mh46yN8tByhSaOAS1LNU95/rjcUo=;
 b=SiAELuZmYQPi5hUiPBehLKK9VcugaOAZ3WpVQ+5zzGaVcck4hscdgaWP3Ocdxm5X0w
 /VSjgmkBenOoidaujjAuvsnovNRjrbOnXqakEZ5AIZML6Tcn1HLpyl7U3kFL/u38462q
 kA3HTpq6xDSIOgZQ15sU1Ue1Imv3aSZ8N1IFNIpl+sfZyWnsf4u+V8A6lNbbL2pklZXc
 R3E76ZYcAqMEM1+x9VKYMXQZTGk/viuUmwb7toI1qSD8YCfKhVgwK9or39f+e/zPZZV5
 S46ED15GLCeGTe+7JDHrIMTWNPH4aPobfK4vLb6CGYNmp2nWKDECsv80h7xTpqw0C870
 +Gcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqhAPabfNJvF1QugjcqWIGMGF9ZgyJ9GCwxhyI85flR+g/WjdCZjDZAN2/aK/2Tg95btLhiDDIwn6x4jhxwzqO@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyCOeqhQnfZoLgfPctGKfELIdFXhJs9asL8S0QeCFrVxMxNorWB
 QEo1N3Kcxkie/SGHmalgbO1W6jXVFCw7bV10fXwFXh3kjYW8e+sXsW6USbnMqpkwz/qUurCOWyo
 Emh8ViJBW1lMN6o4J0Y73BjHLK9ITLbIk/fnza+Li0UiLhHsDZxSPg6w5b1IGfrOZCCi+nHaXgj
 ZdHJHa1B95qiI=
X-Gm-Gg: ASbGnctp0LWCOFEd08j0a1WBZJJoymAtytGPlhlg2PFz1/ewJ/Ti2WEmhmhZmlyLasv
 VuYvxCkP9916bDp8HHWXamkQafyAChROdf8MwQDtFnH0wI6l2TooOTEK2VC0YqAV4BDY3fRVmmM
 Vuf9vAA5b6k3G0NZpS68e6Q35gK6YVajqrLYuAZNHHJ6QVivXz/7YRLdB0DjVDizNRbcHJbzz9X
 tt975YQHtqRRpp2oRuY/XoOkgD4Qj9xWWPfWrg6yaS3xuMZRtEK24j/r65jqVx6VvoI4PNsFLXH
 /WbYalf36PIIf0HzQSI90TZ7j5dFAeD/0ZJuPe9+/ZBO8GMRzd2LWE+jS2CNgCeS8m8VNK7IAYX
 NeNQhS1EcwXaNuzlnonRuJKoFIAa6tkdyP7j8tE4=
X-Received: by 2002:a05:6a20:4323:b0:263:57a:bb46 with SMTP id
 adf61e73a8af0-334a78940c0mr6204482637.13.1760718122384; 
 Fri, 17 Oct 2025 09:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECpvd72xcq56k2PNT+BlO1IjTFbRSih8k3yBJEhp4jcO5r40I0PnCo9OnJxSzIZVhITaAaJw==
X-Received: by 2002:a05:6a20:4323:b0:263:57a:bb46 with SMTP id
 adf61e73a8af0-334a78940c0mr6204443637.13.1760718121805; 
 Fri, 17 Oct 2025 09:22:01 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b0604cfsm26579868b3a.9.2025.10.17.09.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 09:22:01 -0700 (PDT)
Date: Sat, 18 Oct 2025 00:21:56 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251017162156.rsytol3rx4gx4czl@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251009085043.16910-1-chao@kernel.org>
 <20251009085043.16910-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251009085043.16910-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OGALIO6cl2cispHdd96LQLAh6FGMqm43Ub9i9Kgzzhw_1760718123
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 09, 2025 at 04:50:42PM +0800, Chao Yu wrote: >
 _check_f2fs_filesystem() is f2fs specific,
 it's better to move it to > common/f2fs.
 > > Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9nDY-0001QQ-O8
Subject: Re: [f2fs-dev] [PATCH 2/3] common/rc: move _check_f2fs_filesystem()
 to common/f2fs
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

On Thu, Oct 09, 2025 at 04:50:42PM +0800, Chao Yu wrote:
> _check_f2fs_filesystem() is f2fs specific, it's better to move it to
> common/f2fs.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Looks good to me. With the patch 1/3, this change should work for f2fs too.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/f2fs | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  common/rc   | 44 --------------------------------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/common/f2fs b/common/f2fs
> index 1b39d8ce..4d0d688b 100644
> --- a/common/f2fs
> +++ b/common/f2fs
> @@ -25,3 +25,47 @@ _require_scratch_f2fs_compression()
>  		_scratch_unmount
>  	fi
>  }
> +
> +_check_f2fs_filesystem()
> +{
> +    local device=$1
> +
> +    # If type is set, we're mounted
> +    local type=`_fs_type $device`
> +    local ok=1
> +
> +    if [ "$type" = "f2fs" ]
> +    then
> +        # mounted ...
> +        local mountpoint=`_umount_or_remount_ro $device`
> +    fi
> +
> +    $F2FS_FSCK_PROG --dry-run $device >$tmp.fsck.f2fs 2>&1
> +    if [ $? -ne 0 ];then
> +        _log_err "_check_f2fs_filesystem: filesystem on $device is inconsistent"
> +        echo "*** fsck.f2fs output ***" >>$seqres.full
> +        cat $tmp.fsck.f2fs              >>$seqres.full
> +        echo "*** end fsck.f2fs output" >>$seqres.full
> +
> +    ok=0
> +    fi
> +    rm -f $tmp.fsck.f2fs
> +
> +    if [ $ok -eq 0 ]
> +    then
> +        echo "*** mount output ***"		>>$seqres.full
> +        _mount					>>$seqres.full
> +        echo "*** end mount output"		>>$seqres.full
> +    elif [ "$type" = "f2fs" ]
> +    then
> +	# was mounted ...
> +	_mount_or_remount_rw "$MOUNT_OPTIONS" $device $mountpoint
> +	ok=$?
> +    fi
> +
> +    if [ $ok -eq 0 ]; then
> +	return 1
> +    fi
> +
> +    return 0
> +}
> diff --git a/common/rc b/common/rc
> index 1ec84263..4d121a1b 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -3566,50 +3566,6 @@ _check_generic_filesystem()
>      return 0
>  }
>  
> -_check_f2fs_filesystem()
> -{
> -    local device=$1
> -
> -    # If type is set, we're mounted
> -    local type=`_fs_type $device`
> -    local ok=1
> -
> -    if [ "$type" = "f2fs" ]
> -    then
> -        # mounted ...
> -        local mountpoint=`_umount_or_remount_ro $device`
> -    fi
> -
> -    $F2FS_FSCK_PROG --dry-run $device >$tmp.fsck.f2fs 2>&1
> -    if [ $? -ne 0 ];then
> -        _log_err "_check_f2fs_filesystem: filesystem on $device is inconsistent"
> -        echo "*** fsck.f2fs output ***" >>$seqres.full
> -        cat $tmp.fsck.f2fs              >>$seqres.full
> -        echo "*** end fsck.f2fs output" >>$seqres.full
> -
> -    ok=0
> -    fi
> -    rm -f $tmp.fsck.f2fs
> -
> -    if [ $ok -eq 0 ]
> -    then
> -        echo "*** mount output ***"		>>$seqres.full
> -        _mount					>>$seqres.full
> -        echo "*** end mount output"		>>$seqres.full
> -    elif [ "$type" = "f2fs" ]
> -    then
> -	# was mounted ...
> -	_mount_or_remount_rw "$MOUNT_OPTIONS" $device $mountpoint
> -	ok=$?
> -    fi
> -
> -    if [ $ok -eq 0 ]; then
> -	return 1
> -    fi
> -
> -    return 0
> -}
> -
>  # Filter the knowen errors the UDF Verifier reports.
>  _udf_test_known_error_filter()
>  {
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
