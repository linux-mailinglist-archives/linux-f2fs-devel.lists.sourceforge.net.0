Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5ACA5C34B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 15:09:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts0If-0006CQ-BA;
	Tue, 11 Mar 2025 14:09:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1ts0Id-0006CJ-Up
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 14:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QHN+WyTXC9cTVt8Szj+5ZB32yaeO7+nSt9V6FrdnRtk=; b=SFMZ/We4cTl5vqJ8GDFoAYGluA
 8vux/oqabUSc+4kmThh0UiXKeZUafsxW+OLsURKhOnmA/SMJO/ejGiklNz3/0fO/C4GEwvpHTQ4Ms
 8L3aDKrT8HMmoN/JADtuvLVOTFa5YswBhit5MQR4AUZMeVODf1qOiH54YKxpoNjnlwXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QHN+WyTXC9cTVt8Szj+5ZB32yaeO7+nSt9V6FrdnRtk=; b=Vzs59U/lY2RBnnukvdNiy3UTZu
 1NC/dFjV1khWPZxEaZo0eYl/6eRlw6VaNLZzoaR0be/ftMHRFuiP00kpHyfIArzCr7+tfEUeq1rNz
 4VJGwPEb/lik2P20DXfNA9LHDhiAm8nwdMXji2xCHtoqnTEO9cpDN10MqbBCTSe2HsvM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts0IY-0005eh-56 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 14:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741702168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QHN+WyTXC9cTVt8Szj+5ZB32yaeO7+nSt9V6FrdnRtk=;
 b=bQ6vO8ALGigRZrcptizNsaX9sF4Ut/zY9mg4d+P62gT32cMLZVJbYtB4vMNNHF+BTfc4Cg
 li/87CLTOdpTVN840Mo+WAFgll/NanWHDBaNXuxnNfOUWuFGKfFu45kYthFLx9ll11FtQd
 p5+gFmWgula6pOaoRvaV3PoB0WcmdpU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-Jdsx_S1pPA-_jaXQ9fsgFw-1; Tue, 11 Mar 2025 10:09:27 -0400
X-MC-Unique: Jdsx_S1pPA-_jaXQ9fsgFw-1
X-Mimecast-MFC-AGG-ID: Jdsx_S1pPA-_jaXQ9fsgFw_1741702166
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-223f3357064so88501155ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 07:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741702166; x=1742306966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHN+WyTXC9cTVt8Szj+5ZB32yaeO7+nSt9V6FrdnRtk=;
 b=xSAthfpAUyxLrqkPTNyy8JbWXrsT7FFLUdIc0u/K9qn7A9nJX42Xlmws8Rd4H2ezj/
 ZFO9GQZpaD7NiT3bAhI6DqNudd7a+cy9jKEnzTCI0pS/6hLK8tPaooiESzr0WT/5Xb4r
 tVxPrNv8T/RsAFYcGPd8K4C/JUknAeuuRKAeVW+T7zbNChM8MG9iKzzlVXZgEoUnP7wz
 e/rO5UCP7FL+6oqjUesTuOGt37MPxfA8yhT6aFeuGHmQBShqinW5CCKdhIxANF66lsIc
 QHELFnAJO/CLg/z4OXPLvlyloDWqUWLBEgUdDbYFFsJF/nG92wKimbBcxeNSTZUJOJK1
 f62A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLVPCxvGl2Mu7i4Qa1L9DsuVd/sfsGUztDF2vNYtzvu+ocCfMXcTSdYkLWnRODU/vlD+N7ofO/zIj28ymWNARb@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxFGOAGGMk0luT+LckG04tbtQsPboI1yiv+9ViuKsDYD2XcA3eB
 kZ/R4lfNcCtsCPXcglzN7rEAYJl4RfQXGwbCKnS+gWBFJANLL3O8pi+HMFbkrWHm7YOIRnjMX9+
 DRuuWf5hA5U78N6I0oOEqFcw+s+ISySE7QwCizHZbWK9Dx307M2JvmZUIadrC9+2QXSQ13mQfDk
 M=
X-Gm-Gg: ASbGncsJa8eGk42gQOvRq3/ryzZIsAumGXUIcLnp+po3wjrDeECI9S11tRDsVJoggBL
 Y2CMn/XjWNqAom9TmJsrDSautH1qpmBPqoC01esM/RyrBC6QrB3cTNKSUqQsKRewFmbIoYCX5mU
 nNGQau15e8pDFoamDajE1Z0YADFR7/N7zlIXf74C+fMfxzGP8vz6HbjZbP6Q36M0LU/kweqrCg8
 bCJpKTOXJGHrCYYL/pBadvb5VLtMVZnPWX20eNnhUOKObC/beWEMVjT5fQA4Trzd8sFA3UriIvJ
 LSE9W690nv0BxZj9Ijm19JYsREfxg18xj/Cnq0bhoxuUTmgwnMlC78cf
X-Received: by 2002:a05:6a00:27a0:b0:736:532b:7c10 with SMTP id
 d2e1a72fcca58-736aaae81dbmr24406303b3a.21.1741702165932; 
 Tue, 11 Mar 2025 07:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwRe8L4LDh2K3HMdnKilzZNO0IeGk2PElblD0WViJm8ydFFUjXMlOdlQ58DkPx2DHiK9Q+JQ==
X-Received: by 2002:a05:6a00:27a0:b0:736:532b:7c10 with SMTP id
 d2e1a72fcca58-736aaae81dbmr24406271b3a.21.1741702165614; 
 Tue, 11 Mar 2025 07:09:25 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736aead3439sm8716245b3a.64.2025.03.11.07.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 07:09:25 -0700 (PDT)
Date: Tue, 11 Mar 2025 22:09:19 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250311140919.5r4vossfrose2w2q@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250311080430.3696582-1-chao@kernel.org>
 <20250311080430.3696582-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250311080430.3696582-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qmyMh8LXolWqueYsB0hlVqy_VqafGVl3wZqTcX58IbA_1741702166
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 11, 2025 at 04:04:27PM +0800, Chao Yu wrote: >
 Let's export F2FS_FSCK_PROG, then we can use it in > _check_f2fs_filesystem()
 later. > > Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ts0IY-0005eh-56
Subject: Re: [f2fs-dev] [PATCH v3 3/6] common/config: export F2FS_FSCK_PROG
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

On Tue, Mar 11, 2025 at 04:04:27PM +0800, Chao Yu wrote:
> Let's export F2FS_FSCK_PROG, then we can use it in
> _check_f2fs_filesystem() later.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Although patch 2 and 3 can be in one patch, I don't mind seperating
them if you'd like.

Reviewed-by: Zorro Lang <zlang@redhat.com>

> v3:
> - export F2FS_FSCK_PROG, and it will be used latter
>  common/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/common/config b/common/config
> index 7d017a05..79bec87f 100644
> --- a/common/config
> +++ b/common/config
> @@ -317,6 +317,7 @@ export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
>  export DUMP_F2FS_PROG=$(type -P dump.f2fs)
>  export F2FS_IO_PROG=$(type -P f2fs_io)
>  export F2FS_INJECT_PROG=$(type -P inject.f2fs)
> +export F2FS_FSCK_PROG=$(type -P fsck.f2fs)
>  export BTRFS_UTIL_PROG=$(type -P btrfs)
>  export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
>  export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
> -- 
> 2.48.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
