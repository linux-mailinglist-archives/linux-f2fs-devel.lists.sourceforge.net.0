Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC4A58D91
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 09:03:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trY6b-0001JY-CI;
	Mon, 10 Mar 2025 08:03:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trY6Z-0001JK-Sb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 08:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUXALxltmaZpj+QULpZ9mOYplNM+oXSkx8amdFd68t0=; b=lftW3F4AFkcYa2XUF1anRm95LG
 W0NesXoTxxJ8Fh8EBNa8LmPVM/1Ib5wbzB0I5QzfQ+9x7UWJ5fDktO/yUj1ARI8rhOkFgxFSHkCyM
 oTWCRaxmQVlwH3QZoksAjMvoqgsqQVlgyhCDd6WiqBBt/ikA/wcKl6hUqtAok+oBpHb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUXALxltmaZpj+QULpZ9mOYplNM+oXSkx8amdFd68t0=; b=iGXIXZVh4AORQnEBVAo2AlIrnf
 ryqoag6zU//roTXEEnVFS0cXqOt1Eq0jvOX/+TXyYn/Jm4lglIRRiQcabU5epVG2mXlCeo5ONqza5
 B2jlr9jvORYSnFw6IjG7a9GF+pX1EsIsuJOxytrh64KE/CPVrWMDnqDfsLIVWJMTDa5g=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trY6T-0005UM-JK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 08:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741593787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUXALxltmaZpj+QULpZ9mOYplNM+oXSkx8amdFd68t0=;
 b=ZLue011P3YPaWbUZfWggWrQ1rCc7z9FF8+vXWHOGWvPspDiM1makUCjPa/lFFjShPB8Qnz
 n97XVRHoAsPycN7rGVUF6AeJmyyC8gxciGzd8UYHS7vZ/0s8vSWtHuVbryFX9msdzCstx3
 /xnuGcZl1PUpovSC/NTJmRYq3zemleA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-VOoM7XnoOKGTqjpIZ4fZ9Q-1; Mon, 10 Mar 2025 04:03:06 -0400
X-MC-Unique: VOoM7XnoOKGTqjpIZ4fZ9Q-1
X-Mimecast-MFC-AGG-ID: VOoM7XnoOKGTqjpIZ4fZ9Q_1741593785
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff52e1c56fso11946279a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 01:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741593785; x=1742198585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUXALxltmaZpj+QULpZ9mOYplNM+oXSkx8amdFd68t0=;
 b=jOuSQiwbCWTU5xsQfpQHy5ZPTlwWA9N3fUBpULEKvWrCvshpR4RdiPGBR3dX5BRheY
 JooEwnNvzd+L5xdSW4CbN6XW//R8opcYfZVfJmrBqBldnX/pMcCc/Lt6TJFfiPpR1qXR
 /n7VxE/K1LQyaHpVCywuoWktnPRkqzgmtuVny8LE73xjfYBTjNUDE8iOu2it2+VAIClA
 C31Tp4RX1wlEjnPi0WactVSjZFTC4tmaxc2NmQGUg8GOmRvGysxRo39gA1TTo/+yCi5V
 dAvFrEaoavE0Y7WCVyZioLi0LEjLF33rOhq7y0pHr5+4GKTSk5vobzztD8hiWq/0B1MA
 KoxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqEG/xLztaZVY1NMUXYy8hvCkUq8A8P968kbYKLfxv0uJlHdr+fW2v1tF3C7JDNL+6AXiHPzGZEv1DaNjWvILL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzIuFO9eb2UtTIlaaL7hkSvHj0zGC38o7uos/zUF/X4Xl09rQ79
 KuUlTYtOFIGnSBLDZf4DhvFdgTcOhbsMqebAD1K8A+HpzWLoj0leMhfIJOKMgAvyUTl4HudnE7y
 kwaUCgc4FYivSb2eMNxAOUrdP+j9FjfIRbY06WAA96f4/9k7/qSEQ9UP+zBRavrHX8qdF0U1D0O
 Y=
X-Gm-Gg: ASbGncttrz30UftF5LLFD2EjNYCqcOEHMjMZPuocI+tX3OlSV+Cbr/PRgJCA9x8WpQM
 s2MbW8aGT/KXuILcScN/Y2fxyNwGGNX5DdOni3ubGVG4IG5HpmacoeP9zdt/WgDAg0sLVUXeiky
 m85//pHR80iYxv7D6MkrC14CPNUfP+BhFhgnVgpf/UUaHVT27bxUtntWYVHLBnp8g1SonCTRQoP
 f9mC/lTF3mp23EHuFqBPGFVRURvIrfFMxYtJQ92T37++HbE7/AFiU8FSvO4w2RepeBiO1hLNDKu
 7SP/9gs5eVW7bOlSj6DIWmj+D2ngKqlLVIsh2Ivyqhm/nketaEwqIlH+
X-Received: by 2002:a17:90b:4c44:b0:2fc:a3b7:1096 with SMTP id
 98e67ed59e1d1-2ff7cf128c2mr19974606a91.27.1741593785168; 
 Mon, 10 Mar 2025 01:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/fPGQPoLD3g3f5weSujfZfGcb7ysyP5LcmQV0AwZdXmgjt59/dkPBihuAiaciymYjD7qtTw==
X-Received: by 2002:a17:90b:4c44:b0:2fc:a3b7:1096 with SMTP id
 98e67ed59e1d1-2ff7cf128c2mr19974570a91.27.1741593784695; 
 Mon, 10 Mar 2025 01:03:04 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e7393sm7272399a91.31.2025.03.10.01.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 01:03:04 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:02:59 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250310080259.6ormkanynd7l2yrd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250307145629.2b2c6e99.ddiss@suse.de>
 <20250310071636.gombdbhdfbqxwib5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250310071636.gombdbhdfbqxwib5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I1UHfbUN6IXcY0YsXT47MCdyJldyDKj1qF-SiJzU6sE_1741593785
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 10, 2025 at 03:16:36PM +0800, Zorro Lang wrote:
 > On Fri, Mar 07, 2025 at 02:56:29PM +1100, David Disseldorp wrote: > > On
 Thu, 6 Mar 2025 16:18:06 +0800, Chao Yu wrote: > > > > > F2FS_IO_ [...] 
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trY6T-0005UM-JK
Subject: Re: [f2fs-dev] [PATCH 1/4] common/config: remove redundant export
 of F2FS_IO_PROG
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
Cc: David Disseldorp <ddiss@suse.de>, linux-f2fs-devel@lists.sourceforge.net,
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 10, 2025 at 03:16:36PM +0800, Zorro Lang wrote:
> On Fri, Mar 07, 2025 at 02:56:29PM +1100, David Disseldorp wrote:
> > On Thu,  6 Mar 2025 16:18:06 +0800, Chao Yu wrote:
> > 
> > > F2FS_IO_PROG was been exported twice, remove the redudant one.
> > > 
> > > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >  common/config | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/common/config b/common/config
> > > index 2afbda14..8d3047a5 100644
> > > --- a/common/config
> > > +++ b/common/config
> > > @@ -191,7 +191,6 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
> > >  export FSTRIM_PROG="$(type -P fstrim)"
> > >  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
> > >  export RESIZE2FS_PROG="$(type -P resize2fs)"
> > > -export F2FS_IO_PROG="$(type -P f2fs_io)"
> > >  export FIO_PROG="$(type -P fio)"
> > >  export FILEFRAG_PROG="$(type -P filefrag)"
> > >  export E4DEFRAG_PROG="$(type -P e4defrag)"
> > 
> > Looks good. @Zorro, might as well squash in removal of the duplicate
> > TIMEOUT_PROG export too.
> 
> Sure, I roughly tried to find all duplication by:
> 
>   $ for prog in `sed -n "/export/s/export \(.*_PROG\)=.*/\1/p" common/config `;do n=`grep -E "\b$prog=" common/config|wc -l`;if [ $n -gt 1 ];then grep "\b$prog=" common/config;fi;done
> 
> Currently only found F2FS_IO_PROG and TIMEOUT_PROG. So I'll change this patch
> commit to:
> 
>   common/config: remove redundant export variables
> 
>   F2FS_IO_PROG and TIMEOUT_PROG are exported twice, remove the
>   redundant one.

Hi Chao,

As you need to change patch 4/4 more. I thought you might change others, so
please change this patch refer to below:)

Thanks,
Zorro

Author: Chao Yu <chao@kernel.org>
Date:   Thu Mar 6 16:18:06 2025 +0800

    common/config: remove redundant export variables
    
    F2FS_IO_PROG and TIMEOUT_PROG are exported twice, remove the redudant
    one.
    
    Cc: Jaegeuk Kim <jaegeuk@kernel.org>
    Signed-off-by: Chao Yu <chao@kernel.org>
    Reviewed-by: David Disseldorp <ddiss@suse.de>


diff --git a/common/config b/common/config
index 2afbda141..aa5258250 100644
--- a/common/config
+++ b/common/config
@@ -191,7 +191,6 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
 export FSTRIM_PROG="$(type -P fstrim)"
 export DUMPE2FS_PROG="$(type -P dumpe2fs)"
 export RESIZE2FS_PROG="$(type -P resize2fs)"
-export F2FS_IO_PROG="$(type -P f2fs_io)"
 export FIO_PROG="$(type -P fio)"
 export FILEFRAG_PROG="$(type -P filefrag)"
 export E4DEFRAG_PROG="$(type -P e4defrag)"
@@ -220,7 +219,6 @@ export UBIUPDATEVOL_PROG="$(type -P ubiupdatevol)"
 export THIN_CHECK_PROG="$(type -P thin_check)"
 export PYTHON3_PROG="$(type -P python3)"
 export SQLITE3_PROG="$(type -P sqlite3)"
-export TIMEOUT_PROG="$(type -P timeout)"
 export SETCAP_PROG="$(type -P setcap)"
 export GETCAP_PROG="$(type -P getcap)"
 export CAPSH_PROG="$(type -P capsh)"

> 
> Thanks,
> Zorro
> 
> > 
> > Reviewed-by: David Disseldorp <ddiss@suse.de>
> > 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
