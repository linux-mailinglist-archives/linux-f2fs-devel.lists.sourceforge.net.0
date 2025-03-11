Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B463FA5C30E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 14:54:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts03l-0000Ly-KR;
	Tue, 11 Mar 2025 13:54:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1ts03k-0000Lm-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 13:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O79965GHMnQZdzqvYs+SILCGjWQCxMrxIT59ZGPi2yo=; b=PBKf08J4VKIGFdHXnDY14He0Ru
 KJFEFGysVi5MQMebihX5crJBCIxuwAvdfMP3P+oQ6vJA3cPqxCUxjUAMGJpNt+epIg7G0ddzcuQOK
 EUYuPQiE+srGCklUrIBZ6hoBnVtF6giNvwA1DkZTHWnLN2f/yUJF6vYzaHoQsosVQeiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O79965GHMnQZdzqvYs+SILCGjWQCxMrxIT59ZGPi2yo=; b=FLBL592uX69cZGvGZCEUqP1yeF
 5qpw+pinS3tJsCUFg/XORRlb2CIpVrZds6WUV/R93/ZRhTFswL0FoCD51G2sD0fJhnLEEHB5m7eoT
 RzBilcHmBXwbacW580XKS+E6r0yKXjpl7YqSLsAW0mytJQSdsZvxzXd6jDFpJjOnWnk8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts03j-0001kU-US for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 13:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741701249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O79965GHMnQZdzqvYs+SILCGjWQCxMrxIT59ZGPi2yo=;
 b=bwm0yVUcZ3KpJfXMss6aOwpYq7l/HDGqgRvMIMxXOWduYz+yCWVZRqzJCyWmGpMH5RN8Am
 ZJ66VXc+Za26Ys8GstH9ShqLVYqbankSyTYwYbfcMRJP4yfHDG23opSE9nS5kqx1ZqXviz
 XDw9Dy3IpCYSIGv7yUTpuonx0i4TSFM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-OC40BQ5cPhiWJhVMDCeiEQ-1; Tue, 11 Mar 2025 09:54:08 -0400
X-MC-Unique: OC40BQ5cPhiWJhVMDCeiEQ-1
X-Mimecast-MFC-AGG-ID: OC40BQ5cPhiWJhVMDCeiEQ_1741701247
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ff78bd3026so8432819a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 06:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741701247; x=1742306047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O79965GHMnQZdzqvYs+SILCGjWQCxMrxIT59ZGPi2yo=;
 b=feXmNI8O0O4KD4vvEdYLP3wi5wv2EYzHTwY1osfBtCWKkboJR4EVcC6MF/I+3CVHF8
 6ADLqgzsQaUHDrMSH894Qi9fzGrpkM/zTJpZum4a3lSpkuGmZeU1MPjWGJM8O2B8tMA+
 zCU9qRQ3CIlg4Xd9urzAHRzn8mG3ITL8VuXU4kydnfNlvzJ16xEiWDEVeb7kURIEInjL
 xcx3HRgZcrgnygy2dgM8eb/oXARfDSImdzAQCg42bWWEER3GPmF8JfsMkCJT8Iqa0Hyr
 /fU2Xih8vSQtvVtjDHgEfFMIspCW/+gxPIMUnWYhEQSdv6aIXnBPiIF9ejqP6KCOx3qa
 UMMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyBAaPDTUKjsdCfzRuVgdobXNW3e02Zh/GmQ4SHSO0O1rCukfc8tE8/0ptR67xZKiSbRaHQM4jYLSjS5oo0r+s@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzYx50TgQF5EB9RduPjN6JbiFFQjRJwpqRfBqrlBdwFvNppWCkz
 I68EgxNYSSTnPyhrpcIAXKzsoxLXoh7I2M3M3La4YABWgFMtvELvXeDmr1MwI6zK9dM6hFWNmD3
 RSfoS94sU7i5vCzpubCwU/E9+A9Z8myKII0yI+n50RdlYXPK1HL5+VH4rvQ6jdrXflhGZjKyrtC
 c=
X-Gm-Gg: ASbGncvTkLHPtx3etUhG1aV7iQhZlXxaiCc9u+NICKtPut4mO7K6kmZwINDtah7UDex
 vaAomvMJPMSnQbQU8MKmlzDlh+6bRg7R24PDgL2piAOsUIP9/9c2VUXKIXxZULgiJV4FIWhyPlh
 661WR/OgLRLSeqy57EF13WYgyLNP3u4RgEz9Cqg40YEkqezRasr5jcKy0AsxhrwEaI7+xNrOqGP
 eegRgz0el7KPzXHDLW7EaHTXEQuK/fakNP2sGuAoM3bXHN8EB1X4itCussN9xGLn5TmZ7LJD/w5
 /+Qcc/UTSuBrBRV7NbTyugky2thTyb6DH04X9ic1m+NGzdl4aZDzFlNH
X-Received: by 2002:a05:6a21:6da7:b0:1f5:9961:c40 with SMTP id
 adf61e73a8af0-1f599612eacmr452704637.8.1741701247499; 
 Tue, 11 Mar 2025 06:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsfa+HMGbPL4Sr6Zt8vhSaG/t2qB01wMJ0yaRFEIHDO2gb3d0qnjhzZcjHOyI0QBFYX+tEVg==
X-Received: by 2002:a05:6a21:6da7:b0:1f5:9961:c40 with SMTP id
 adf61e73a8af0-1f599612eacmr452672637.8.1741701247117; 
 Tue, 11 Mar 2025 06:54:07 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af533af1fd1sm3095346a12.62.2025.03.11.06.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 06:54:06 -0700 (PDT)
Date: Tue, 11 Mar 2025 21:54:02 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250311135402.l3kpgbgnwg6zn33e@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250311080430.3696582-1-chao@kernel.org>
 <20250311080430.3696582-5-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250311080430.3696582-5-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: trHFQPGXzgGPA4gOi78z4LtY34q2jDB7MC8WIUebtdc_1741701247
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 11, 2025 at 04:04:29PM +0800, Chao Yu wrote: >
 _check_generic_filesystem() will fail the test once it detects > corruption,
 let's introduce _check_f2fs_filesystem() to just check > filesys [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts03j-0001kU-US
Subject: Re: [f2fs-dev] [PATCH v3 5/6] common/rc: introduce
 _check_f2fs_filesystem()
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

On Tue, Mar 11, 2025 at 04:04:29PM +0800, Chao Yu wrote:
> _check_generic_filesystem() will fail the test once it detects
> corruption, let's introduce _check_f2fs_filesystem() to just check
> filesystem w/ --dry-run option, and return the error number, then
> let caller to decide whether the corruption is as expected or not.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - introduce _check_f2fs_filesystem() to dry run on f2fs image
>  common/rc | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index 23b642f4..00883eb7 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -3519,6 +3519,46 @@ _check_generic_filesystem()
>      return 0
>  }
>  
> +_check_f2fs_filesystem()
> +{
> +    local device=$1
> +
> +    # If type is set, we're mounted
> +    local type=`_fs_type $device`
> +    local ok=1
> +
> +    if [ "$type" = "$FSTYP" ]

This's f2fs check function, so $FSTYP can be "f2fs" directly.

> +    then
> +        # mounted ...
> +        local mountpoint=`_umount_or_remount_ro $device`
> +    fi
> +
> +    FSCK_OPTIONS="--dry-run"
> +    $F2FS_FSCK_PROG $FSCK_OPTIONS $device >>$seqres.full 2>&1

FSCK_OPTIONS looks useless.

> +    if [ $? -ne 0 ]
> +    then
> +        ok=0
> +    fi

We generally output nothing if no corruption:

$F2FS_FSCK_PROG --dry-run $device >$tmp.fsck.f2fs 2>&1
if [ $? -ne 0 ];then
	_log_err "_check_f2fs_filesystem: filesystem on $device is inconsistent"
	echo "*** fsck.f2fs output ***" >>$seqres.full
	cat $tmp.fsck.f2fs              >>$seqres.full
	echo "*** end fsck.f2fs output" >>$seqres.full

	ok=0
fi
rm -f $tmp.fsck.f2fs


> +
> +    if [ $ok -eq 0 ]
> +    then
> +        echo "*** mount output ***"		>>$seqres.full
> +        _mount					>>$seqres.full
> +        echo "*** end mount output"		>>$seqres.full
> +    elif [ "$type" = "$FSTYP" ]

This's f2fs check function, so $FSTYP can be "f2fs" directly.

Thanks,
Zorro

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
> +
>  # Filter the knowen errors the UDF Verifier reports.
>  _udf_test_known_error_filter()
>  {
> @@ -3623,6 +3663,9 @@ _check_test_fs()
>      ubifs)
>  	# there is no fsck program for ubifs yet
>  	;;
> +    f2fs)
> +        _check_f2fs_filesystem $TEST_DEV
> +        ;;
>      *)
>  	_check_generic_filesystem $TEST_DEV
>  	;;
> @@ -3679,6 +3722,9 @@ _check_scratch_fs()
>      ubifs)
>  	# there is no fsck program for ubifs yet
>  	;;
> +    f2fs)
> +        _check_f2fs_filesystem $device
> +        ;;
>      *)
>  	_check_generic_filesystem $device
>  	;;
> -- 
> 2.48.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
