Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2EDAA567E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 23:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIx2pYVcQboP0xK+kReAbpyOgd335QeqVyjK8LRbjOk=; b=V/VasDLS5uNUf1Kmhtm4bXpVEh
	BsHaUfBofPoyrAyUuEIVXz3yzNpsr5K2tWl1Gd8YtZ2pvQBtqtCGfQQXxYC336Sa7mV3rTw9WAX77
	Fr/LdQ0F6yfTg3C35loE2iQ25pSyVpPsaKexEP2XgHwGKZ15uyWSXLr3GT5GJTH9d0d4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAEgF-0000IC-TA;
	Wed, 30 Apr 2025 21:09:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@redhat.com>) id 1uAEg8-0000HD-A3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 21:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=; b=Cq+rLoeE+z81nk/pHzJbZsOqNR
 w8jbaZL28fijp/uuZ0cjD+BK4RG7nvJZFwGFZMQT5970yVscI6B396Qd06FubLDoDfDvMwru3hl8x
 oDrIBVljDxJfWcF47TZP5HaC6zvbJikmf85v2kz59QGM1ultjEmxvd4tpJ7QHwtX1hJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=; b=MikJBAWIc9opoOcMDTMuV78fZS
 tU9ZGC9NqxhoxLWd3Bdnlq2B2y0i5gm9iu6whUY7+pGVlZHuUG9UxHO41bY6OScXAoCzieBzydvrd
 nQ0FrdBg5c/shhXkFFdzfEkU0kSHXRXMCdBX0Yj1M0tC0j3akden2AZVCF78F1MmvNYE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uAEfs-00017e-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 21:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746047329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=;
 b=N9c5HTEqtEznulmY2v1sf0IEMbtWdT4MdCyVdYUwHt2i0FiYiiRD98ScictM+pXCV9sQlh
 GUlbmIE5V0TDEpQVr6A3bRDHEulaCmzWeF34BTQASsmPs9+VpU3GapSImg/KyVpFOWuBDL
 vCUanx+dju1hX+LtwOUzhHgVpMEM0Vc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-hJ9Ob03OPpuw4ikNy-17mQ-1; Wed, 30 Apr 2025 17:08:47 -0400
X-MC-Unique: hJ9Ob03OPpuw4ikNy-17mQ-1
X-Mimecast-MFC-AGG-ID: hJ9Ob03OPpuw4ikNy-17mQ_1746047327
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d0a037f97so1170065e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 14:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746047327; x=1746652127;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zivfWyNlrPG9L8bV6ILZM8QQWLlmYfH2OI8xtHwsDYA=;
 b=UHboXbv8pjFspWbobmk8+9Kvy0p5jVPCmYRVyodwEIZNAhyIp83JTCtcIMTTuJaJ/6
 rNGPm3gdGJnVk5vnw7fFUzpwvxWex0QPuTstO2EQBSFtOt6YJWS4njuAibGwVozNIv4R
 YuCy1HwchBCKDbXJrYECZzvqfAUMBEbPA1iODGi4XFH+lSaej3jYwCwlApchKaV0UaNj
 OMztpj3oYCjoTV31srLArGr5LF8Jvhei3nP+TZmdJ4WlbKwE2EmIP1hnCFtrSqXKn8vV
 1K4X/mKLCSrDjRy+G9dY+EMlw8XRaSi88eAxWvdk9TMY9/kfCjslaMurx+/QmF92RD36
 uJyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVri1VnRGMKTCjoxSKO0Rwhu9zzYd71bs0RkgUCWmR6kZwLVFQ/i/RWIc91Yc5v76ElMRHnkw1NvEWEEhNOrON@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxj8Gjzf3Rtf9IK01hBlNY26gKGLF18oePUhrZP0JxiE2gIq5xq
 EzxXxT7n4WUJ5QbFpBTA/DxLY1dvvnc9F4QvuBq9Uya4/e3o0Am2MUSJUSNxMDS+DbaHNkP7RlV
 D0tD+Ns08LhcO0ZXDhqA3d+jtmtp2G7CVCvXjJalpM5/HoU7+2nGKgr6UyGkr+IMdyyFgTCF17q
 M=
X-Gm-Gg: ASbGncv/pv3y0YYZupVB6ugUJM0D/42XKC07ubAxxtwOFvp45vr27g48cnp471H96NP
 V3+nwAECAly2NKckBUB3gjPHnUtog9B0O8pSdziR9AJuexo2jvBFJD75WpQnee/ayOIaY2qIWt8
 0eXdnJ9pZ0nHmXHtkkixnY5SkbfmzieANsGAIJhBpvk5X83RGiZXw8Ri64Dx8XICoKd7RxTTZcN
 cGs/oYCuTptOP0/M5JNd+PE8Rnt5SVMVAwdW7NT6DOoNTls8rnnnXck+tCEtML4bx2e3+SZ3XCN
 b7MlPbLzXFQ/tKeSQrA+rpzaSxORpVYgqERqKChDlRgYruxjERQ+q1fB8y6tdOLlCWbuh9y39hz
 BGbanKjZ+/XLsLMaPh8mG9c2mCV3rqVrNl668k6g=
X-Received: by 2002:a05:600c:348f:b0:43d:53c:1ad6 with SMTP id
 5b1f17b1804b1-441b268b895mr33349955e9.26.1746047326795; 
 Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f0+HkEz4Uo33Hw3JPFkBBMMlgPMy0LoULhoOPwOo2pF6os8H6HmYyJy1+xhQYEFMMEFIlg==
X-Received: by 2002:a05:600c:348f:b0:43d:53c:1ad6 with SMTP id
 5b1f17b1804b1-441b268b895mr33349775e9.26.1746047326420; 
 Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:a500:7f54:d66b:cf40:8ee9?
 (p200300cbc745a5007f54d66bcf408ee9.dip0.t-ipconnect.de.
 [2003:cb:c745:a500:7f54:d66b:cf40:8ee9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28718sm37053035e9.36.2025.04.30.14.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 14:08:46 -0700 (PDT)
Message-ID: <16140962-0a11-4674-8799-a83a13e2aaad@redhat.com>
Date: Wed, 30 Apr 2025 23:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
References: <20250430181052.55698-1-ryncsn@gmail.com>
 <20250430181052.55698-4-ryncsn@gmail.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: INOtqSjiHPuDcKJDv7DMwUejDvh1Jm_sMpztPhjTBbE_1746047327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 30.04.25 20:10, Kairui Song wrote: > From: Kairui Song
 <kasong@tencent.com> > > folio_index is only needed for mixed usage of page
 cache and swap > cache, for pure page cache usage, the caller can [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uAEfs-00017e-E4
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: drop usage of folio_index
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
From: David Hildenbrand via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: David Hildenbrand <david@redhat.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Yosry Ahmed <yosryahmed@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 30.04.25 20:10, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
