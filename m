Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740BA58C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 08:17:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trXNc-0001H1-UR;
	Mon, 10 Mar 2025 07:16:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1trXNb-0001Gu-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 07:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQirfCA9HiZWh1c8EoIvu5VftAyyl1M7tFQE639mTI8=; b=b9TefOFRj7OqXTHSwYYOCivm0C
 QS1jYY/wyPJ8HigY5JZ93ydverjWl+fAKSjTbn0uV/lSwouTN0GZ1WlYROHm9hYF9VdQdpVzTyOAv
 B/0gSGiXfyxKUa+W1/E+j5O/Edij5YRaIJ4Ws+/7tGkOBAnPrp3/lylBa9Y2/zqkwf5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQirfCA9HiZWh1c8EoIvu5VftAyyl1M7tFQE639mTI8=; b=W/ywGiJcotH2Uwlz+dUNOHB7sw
 dcNxavVg/LaPq96KlKRPznq/uediCzcM1d4yH4LML4syhj6Zb9w1gGY1u7Fq+GJh8CvT3AXNPjPYY
 8+mPzo/Zau4hpFVrWbE8L0ebs/2F7AE//O/NGAKZQf2q4Q5CJaSGokM0CVhdrjVF7QCk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trXNa-0007pT-Hh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 07:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741591004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQirfCA9HiZWh1c8EoIvu5VftAyyl1M7tFQE639mTI8=;
 b=PHaG/TzOIhIfJMOBfG4tsSyhXJodj3JgPJ14Ctorl0LpvkF9i5RI1aGJyCwqUrwklZK+h0
 Mjv0a6+wL9J/0dsuSmi5EhKph5gBQ4ACEj1hGY7ZQX1Wvhi6NCAg1eSAefBItcM0UtnImn
 cu8gLo0dEc0ysfC/uVqlubweX1qa69w=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-Fzuj-EHONLWD_5e6gFzyJA-1; Mon, 10 Mar 2025 03:16:42 -0400
X-MC-Unique: Fzuj-EHONLWD_5e6gFzyJA-1
X-Mimecast-MFC-AGG-ID: Fzuj-EHONLWD_5e6gFzyJA_1741591002
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff5296726fso11893603a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 00:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741591001; x=1742195801;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQirfCA9HiZWh1c8EoIvu5VftAyyl1M7tFQE639mTI8=;
 b=h3wRF5/9JMYhFJxMevjxQm8/ebUcua4MXVaFnWeaXUlJYNA1xTaHpcuQOTbQWwCvE0
 FZdU2Nx77pxEUam8Eu7q9+owLgvIy/KqqdWKqcRiLdUCb3ZcMlEEU1fKktjAKXGaiNq5
 iZ0fB+IRqmbFQLmcX474LIIxMx7X1c+iIcf3Uw58/xhRWVK093UNydyDP9aPGHRoF45A
 4Wo1TIT2tr8yDW3AiGYRifVCVjj0T7ZbC3ei/LKEq5yQjNPmngczWn+SSL6hURA5+KtD
 tbrDTvAADbkw+eFZThOZvNa+LCAg2jnHnYWEccZ60hFU8uuaSNZOAp7LobbWK1cL0CSZ
 YN7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbiUmaPiGQV228Sflj0sZhP00cYMbBpYkQL7pJcSGDCmDLH94vj3fM5IBdpz1AIpkUrPA4j9GXiTZMXUeIhox/@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw8a2F0kqQRPo+WYC/uDJJA23mQ4uR9aa1T9EUn7e/uTnWUx8bH
 h94a0OOIjZJh3kXPe/XG64iE2yYz1J/URRPC7F8J/I2/0Fi0tahMibRNMijzF2PLWOuLLD54WWX
 jgAcIvICVaoLOiTuNSGCqgh8/H/HPtoc1dHJbK8ILEMB0kHp+Huv0gm1jP6rKZfpXTL5si8Fa4G
 4=
X-Gm-Gg: ASbGnctmvCanEYs25YWLlLcp0nwSAxdooAH03ug/1FTmPztUm3OC8XBEaCUajWm8pQp
 x7LUnE6OgUJalApdpD3KyrBSQ0uL35XCRlB0cb0ODmGLMKNZToBF4e0c0qyIdIadJ210J6cCknH
 2Ofwhu7qY0RlilzX8fzhREKe2sR2hu5jov2AHoOZpHTesf0SP9x/7OOSIZl7mN1dXNL0kPiA0P6
 nlKhQzc/XOEGNLtAkVcSdABLL/pTPt/KOSe1V2IkCyguG3aEQXowft6ki1EyB5B2ScEphxYOm20
 4i/CUji0nx8J5WAnIEbjQW9OPngcFpSSBgU1LaX8O/3rPQFcubZX3Xy2
X-Received: by 2002:a17:90b:3849:b0:2f9:c56b:6ec8 with SMTP id
 98e67ed59e1d1-2ff7ce9114dmr20487385a91.10.1741591001697; 
 Mon, 10 Mar 2025 00:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc6EQwUtEp4Y8Jzau9HNcPdgmtBv8PQ+Tr4tlgHuhPCkoqZCQdLaK3xn6raeV7MqzyKuJ15g==
X-Received: by 2002:a17:90b:3849:b0:2f9:c56b:6ec8 with SMTP id
 98e67ed59e1d1-2ff7ce9114dmr20487365a91.10.1741591001283; 
 Mon, 10 Mar 2025 00:16:41 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e72d1sm7225168a91.34.2025.03.10.00.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 00:16:40 -0700 (PDT)
Date: Mon, 10 Mar 2025 15:16:36 +0800
From: Zorro Lang <zlang@redhat.com>
To: David Disseldorp <ddiss@suse.de>
Message-ID: <20250310071636.gombdbhdfbqxwib5@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250307145629.2b2c6e99.ddiss@suse.de>
MIME-Version: 1.0
In-Reply-To: <20250307145629.2b2c6e99.ddiss@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j67z8idE8VqHYOdV0PuxWg4C-dK3SgwJT1Z3F16N6Eg_1741591002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 07, 2025 at 02:56:29PM +1100, David Disseldorp
 wrote: > On Thu, 6 Mar 2025 16:18:06 +0800, Chao Yu wrote: > > > F2FS_IO_PROG
 was been exported twice, remove the redudant one. > > > > Cc: J [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trXNa-0007pT-Hh
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 07, 2025 at 02:56:29PM +1100, David Disseldorp wrote:
> On Thu,  6 Mar 2025 16:18:06 +0800, Chao Yu wrote:
> 
> > F2FS_IO_PROG was been exported twice, remove the redudant one.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >  common/config | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/common/config b/common/config
> > index 2afbda14..8d3047a5 100644
> > --- a/common/config
> > +++ b/common/config
> > @@ -191,7 +191,6 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
> >  export FSTRIM_PROG="$(type -P fstrim)"
> >  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
> >  export RESIZE2FS_PROG="$(type -P resize2fs)"
> > -export F2FS_IO_PROG="$(type -P f2fs_io)"
> >  export FIO_PROG="$(type -P fio)"
> >  export FILEFRAG_PROG="$(type -P filefrag)"
> >  export E4DEFRAG_PROG="$(type -P e4defrag)"
> 
> Looks good. @Zorro, might as well squash in removal of the duplicate
> TIMEOUT_PROG export too.

Sure, I roughly tried to find all duplication by:

  $ for prog in `sed -n "/export/s/export \(.*_PROG\)=.*/\1/p" common/config `;do n=`grep -E "\b$prog=" common/config|wc -l`;if [ $n -gt 1 ];then grep "\b$prog=" common/config;fi;done

Currently only found F2FS_IO_PROG and TIMEOUT_PROG. So I'll change this patch
commit to:

  common/config: remove redundant export variables

  F2FS_IO_PROG and TIMEOUT_PROG are exported twice, remove the
  redundant one.

Thanks,
Zorro

> 
> Reviewed-by: David Disseldorp <ddiss@suse.de>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
