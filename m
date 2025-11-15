Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE56C600A6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Nov 2025 07:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Guet2WWgmjwz/VmhKsyRsBcELDWoaaImfiy54k1SUWw=; b=llne5wz2TV0+IgpV0jKmRMcBkt
	S51y3aiv57N4GlSxhZlFPq/dz9yvt6v5Bw3ZDdyRjERGcewyN7ITNZeRsAsdaWXjprZGOZu8JOH4h
	hFyXOx2zFrte0EGaKVSJnT3KhEd9/+URDmEV490fRiGDD80aiqUMxdD4GrDW3hSznztU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKA67-0008VY-Iz;
	Sat, 15 Nov 2025 06:49:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vKA66-0008VR-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 06:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yqQof21RDOM1mJKKumuiVy44qnJZ5Tg2vh9qh5UPau4=; b=JshBpi7w/Brcdy+gA16ZTyz/wZ
 ePya7tajU+UogMwSdSx/rB+rV3NXsXhwrPlQYq56wplLsE0wOnqZY0qlyob+EG4l4SBp3zlNDdzcO
 33AXQxFn8VLW/yhY9Dgx+w0wbG0pv5DRvT/AW3vsWyGIS+rMRy/fBWv5S2bWvXz6bO0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yqQof21RDOM1mJKKumuiVy44qnJZ5Tg2vh9qh5UPau4=; b=cy8gM/m/g431cIu1Sk5/3KOblf
 geEnzVO+wH0/IYCQUuZbu96jh4N84ofXCMDLrQFTW/R+CpA6deOGmd78B3rRzkW+LZchR8rVJ2QH7
 V6pAsp1unsjzYNb9twZle44vw6eB9VyxgkA+1K01Oq/beDJBT4l/vxxupH7jk3JBIbBg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKA66-0004MD-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 06:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763189356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yqQof21RDOM1mJKKumuiVy44qnJZ5Tg2vh9qh5UPau4=;
 b=ee4KGymgiyrJdXOEnSmjNSmSOSfJPQh1QiZG+Yd2fHZERRKYPKeG9y4xsYY+r99GUIZTDW
 SMeHUYWhujPNz5ESB2eYTz2HfxVEFxSJv6lTnhhY6asFUgcIaFwRaOIrCCaSHjna1L/b0+
 xEHxZ+tsUztZEyOXEKWb6/ASBc9pP/Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-3X0IQtRkOk6FjXTlb9c8YA-1; Sat, 15 Nov 2025 01:49:14 -0500
X-MC-Unique: 3X0IQtRkOk6FjXTlb9c8YA-1
X-Mimecast-MFC-AGG-ID: 3X0IQtRkOk6FjXTlb9c8YA_1763189353
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34377900dbcso4194483a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Nov 2025 22:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763189353; x=1763794153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqQof21RDOM1mJKKumuiVy44qnJZ5Tg2vh9qh5UPau4=;
 b=sAVnF4JB8d0GAlnJVTM89aiNt9U8VN+TKVwtsXEsnuy6rYyETrliwxHR0ykcNFDWtx
 j+D7935Btm1fNjIw0Tqdoc3TYIwbZy8wZzwRleuC0ZocTURbctESW/JtdrUzMwaJgDvU
 MuLEyJ7BaE6hbm8QMY/pOuKfJIW/pUP8d02UEED2l6iPHltMyCkJWMaVX7XZsGZ/RwzG
 Ass81g8yYibw5zA/Kfgb4467M8GfpmuwygFw7VoILXhd1Sxs7UZnlraZvp26CfcuNQsg
 EkxzUVTLO8hreLSJFB5+vJ3uHdadiRUPpj9o8eY6ir0Iowwqm2R6rw8uoI0ILIeMWHhM
 u3Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLqgXOiHsmUYCBh2ri9TBcfk7yHiWKh1DGipbWE14wQFmXLWl1AFQb9cDjwE0DhqmZfg3lEGGp6eXmO9c8oCIr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxqYSZTA0yMT2HGNEqXXaH7yr+UsfvGFxvSkvkePZC/zOURO5tK
 hCR/u66ywzp4r9KrybTHJlo/oVcUqNPPQf/iV8tJo2MWwAID48WyAqur4Ip3vrMJ+VUCrFn1YKi
 qAVTBrDUvTRadRv1GfDIpbmQiT+sx+rs0sDTfCsk7Vz3g2dXMou3msaNwcgg2ZgBweiEcFDv0b8
 jMXYM=
X-Gm-Gg: ASbGncvgEl+E+bJydyoojrTe7B9u6iUPVfkpTgCrJbky4PT9eGUz2QYL9+wRUxuBZHH
 Md/J6OfTxY/gASHrwNDfcdb8Bm2I8Nojd50hPrQ14BEgzMG2nxkXqAtMmrk8ug3xYnJ/wszjIv2
 a3hegDbFC1OCY1NbwQOTZgaD2y447fGrvayFeNL6Ic+2rMspCPtAKzKBdV5Bl033e16FaPE8WOv
 2+hWeWuaTnBqFtgDZQ0OTpOSxNoYow8sNvXB9JqLbOUEAPlAU6ub5BbnoWXB1YTkj0N/0GgqSWG
 oibyo6W/DzFVHJiYuEKGRnC/x1vUcihwetIcgHp/2EhSINSlmaoyvSvGrYyWpwJjreQbGN2/jk0
 pp+xptCWIqu8nyMG5k71XATNyOYKky0Uqei7HE5HAdlRulGuo7g==
X-Received: by 2002:a17:90a:e18c:b0:340:bb51:17eb with SMTP id
 98e67ed59e1d1-343fa0dbdafmr6288198a91.15.1763189352949; 
 Fri, 14 Nov 2025 22:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoDwemDOUMDOzq5FMhyftOyNr4AOfBbyBLs3a/ms/NS2kBwLP6MxkzTNyBMQVVNl7xA1rFdw==
X-Received: by 2002:a17:90a:e18c:b0:340:bb51:17eb with SMTP id
 98e67ed59e1d1-343fa0dbdafmr6288178a91.15.1763189352473; 
 Fri, 14 Nov 2025 22:49:12 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343e0624f3csm11317448a91.0.2025.11.14.22.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 22:49:11 -0800 (PST)
Date: Sat, 15 Nov 2025 14:49:07 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251115064907.tfrm6d5p2zlpmf7u@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251112135223.3467852-1-joannechien@google.com>
 <20251112135223.3467852-2-joannechien@google.com>
 <98034c77-5e47-43ea-9c45-335e2cd51b68@kernel.org>
MIME-Version: 1.0
In-Reply-To: <98034c77-5e47-43ea-9c45-335e2cd51b68@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gvmorX_hFNHW-tkINhTm44EqPN_CB2o8m-rbu-R7QBI_1763189353
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 14, 2025 at 09:33:58AM +0800, Chao Yu wrote: >
 On 11/12/2025 9:52 PM, Joanne Chang wrote: > > Add test cases to verify f2fs's
 support for different versions of the > > "test_dummy_encrypti [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vKA66-0004MD-Ek
Subject: Re: [f2fs-dev] [PATCH v1 2/3] f2fs/016: add test cases for
 test_dummy_encryption mount option
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
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 14, 2025 at 09:33:58AM +0800, Chao Yu wrote:
> On 11/12/2025 9:52 PM, Joanne Chang wrote:
> > Add test cases to verify f2fs's support for different versions of the
> > "test_dummy_encryption" mount option.
> > 
> > To ensure test robustness, the MKFS_OPTIONS and MOUNT_OPTIONS are
> > cleared. This prevents additional options from interfereing with the
> > test results.
> > 
> > Signed-off-by: Joanne Chang <joannechien@google.com>
> 
> To Zorro,
> 
> The changes look good to me, though, still I want to confirm that whether
> it is recommended or not to add new cases in old testcase.

Hi Chao,

I think this case isn't a regression test to uncover a known bug, it's a
basic mount options test for f2fs. So that makes sense to me to add
"test_dummy_encryption" into f2fs/016, especially if it doesn't need to
bring in more _require_* restriction (right?) .

Reviewed-by: Zorro Lang <zlang@redhat.com>

Thanks,
Zorro

> 
> Thanks,
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
