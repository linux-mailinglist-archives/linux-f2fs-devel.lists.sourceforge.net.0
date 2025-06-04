Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D37ACDAE7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 11:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbJA+pdRj4/IzkRndhMEaFxLmDrbgV+VEjUhi/SY/gU=; b=MXQ1JWzHj+cYxvJJT1Q0w+lO1C
	RzyzaMJaDE+ANcsn1w4A1fukZTIDEvvDpdwICTpPt7VjdToUGMCVkcwN6LJk84YZcDdIi7QaWqkOf
	j3kK5cr/Ne71ucWi+yUlmMP3dZq6v3q85FEqSkwrB5uMWVbosqEoJrxPbyICcZZOPne4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMkL1-0006J0-8N;
	Wed, 04 Jun 2025 09:23:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundanthebest@gmail.com>) id 1uMkKo-0006Hy-7d
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 09:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kxD+BS5BNW9JlEJcYvio44SXpqyv8Wmatgad1UAi7lM=; b=Z6h7FnOy68REHSin35xnTIZkud
 /8AkDPt+0piKpOmWmf61S3Q4gcJsB5Nwyiiv5bxw+3DGgvcRJOlI4fbtXo/gGzbBYLvX5KEKZYzV1
 3mTd1AlfckhSGmboFCv+oO0fNdjGstMtkHgKyDqlYpT2f3NxgYdImJPkMr8fxkkLrBNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kxD+BS5BNW9JlEJcYvio44SXpqyv8Wmatgad1UAi7lM=; b=d1n/TGwp8/fciZ2cZ6W2zfTktQ
 hO7xULzzC4OYDEAIU+rTKqW7tpNYDZlDlgDMuNCirCa1f2foIjnyoVBsYLHL2/i/t7rQsUICBIQo3
 sfRHJlZ1wgJLLu1CjE+DFvVIT0l3YiDcPTrhEJgn58YSx2tNRX7ny3N3XoRYj/8U4DKs=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMkKn-0007nx-KN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 09:22:58 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so1154859266b.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749028966; x=1749633766; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxD+BS5BNW9JlEJcYvio44SXpqyv8Wmatgad1UAi7lM=;
 b=kohP+VSlkODn73XygCWFh0Yk3Zvu++nGfVEWb1TXjjyXxJQL2a0MktKI4DB8WTLwjQ
 57fyN5x+/foO80FBLYh7uOZ5IvELjQYXLSXNJ7s3pHvFquWMc3xvEwRF9itMDlDF4SxO
 4N6EWD1QCkee78Ozh+uKWuZh4a6a+HIgKQuXO5nfHpCq4qObTW/uhMk8qtOMeEbmvcBk
 /WovJ8V6gJwFf/0VKqfYMfXoJEzTznitMUZjeWb7rGIE+h2vBJBxujx6amJEEnJBafXY
 8E9v1/oblcAHRfkiPhjzBrnM8Q3lnRc9lejnRvE6vdlBEUsTc5hI6ligYpCEUDQs495m
 WOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749028966; x=1749633766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxD+BS5BNW9JlEJcYvio44SXpqyv8Wmatgad1UAi7lM=;
 b=oqXlJrKij5FFoiWDdvtWxR+7zNaeN/fFaz7BLdZkrMLL/zqTCPpwPTxmuTiTfxc2/b
 iYyL+26t4jY+r4t3StRcH3BE79XWGv/bXaktVQma3IfwcPdYom/tKUrtIDwZU1rYVM7F
 LL39cbvf/BGRBaQV9qvtm0j+WeWJK2rk9VJXJBjzr3lGFsv6Ve9Iku1KK0CMfYs5W2pW
 N0rUkHz9cURFGhkZW1AhX4r8UNjHSikSof2qOwi8ywphhnDCw9/0mf8acnaPDixIXAw8
 Kq+vN6z9FsKxmpWVE86Uwuw4KEpVFh2Goc+hT6lvHdtHknjk/+0IHOQ4YOUnOLP7us3w
 ksWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyVnsB7jWpTkXPNnnmJoeBaCcjS1/XpB4/5YwTY581cMqwzlMjFUQERp2SM988dZLWfv6Oh4VBYonDEsEU0R1V@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxUrp7CpHF4DLm/rm6pZiDLVC06g4pRSuZPRQkNg7ocwiAFYVBJ
 EUnAGpy6QiWevIbs3OqkOY8Mfau1yn/DXFr5iJbaNHkpgfhxk+LaN/Df6yqBeaRl1yHM9dJ5cJ+
 qQi3Kxemv+3fNicjZApmdWuj8ZN2umCk=
X-Gm-Gg: ASbGnctqti3KxVhD9t1qYK5Q3kgvrqtJVKAf7FWmmz9xWaXgiRxzGI38mwiOIEG/ipq
 cuvzO6vXzJwXzxGuT/1/l74LQSFyBtFBfX16EoeHC80soUb9gPscUsO932GmSP3V4JKWJ4N2Vjq
 wNhF6Gfj7sonXu+tHUTHm0YJv00RNvLHJQ05wyLjES11UJwZFp2HSv/0jjEb0UYoHKHGelM6Bw0
 8oS
X-Google-Smtp-Source: AGHT+IFtmWSVIfRymSX8p9O1DuQ9uGU3imVuqryH0lzpbx4dWpXx940NayRL5XU/iX+3A15SSf0ibjMq2HLSlqBsVEw=
X-Received: by 2002:a17:906:a995:b0:add:fa4e:8a61 with SMTP id
 a640c23a62f3a-addfa4e8f2bmr123364566b.38.1749028965818; Wed, 04 Jun 2025
 02:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
In-Reply-To: <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
From: Kundan Kumar <kundanthebest@gmail.com>
Date: Wed, 4 Jun 2025 14:52:34 +0530
X-Gm-Features: AX0GCFsIp4hEknwUTt7cvxyvZfmfYSDQ8XVwMfEKcuya3JVRf5uqzsLfTt2zwvo
Message-ID: <CALYkqXqVRYqq+5_5W4Sdeh07M8DyEYLvrsm3yqhhCQTY0pvU1g@mail.gmail.com>
To: Anuj gupta <anuj1072538@gmail.com>
X-Headers-End: 1uMkKn-0007nx-KN
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 Christoph Hellwig <hch@lst.de>, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, Kundan Kumar <kundan.kumar@samsung.com>,
 willy@infradead.org, p.raghav@samsung.com,
 Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, gost.dev@samsung.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiA+ID4gRm9yIHhmcyB1c2VkIHRoaXMgY29tbWFuZDoKPiA+ID4geGZzX2lvIC1jICJzdGF0IiAv
bW50L3Rlc3RmaWxlCj4gPiA+IEFuZCBmb3IgZXh0NCB1c2VkIHRoaXM6Cj4gPiA+IGZpbGVmcmFn
IC9tbnQvdGVzdGZpbGUKPiA+Cj4gPiBmaWxlZnJhZyBtZXJnZXMgY29udGlndW91cyBleHRlbnRz
LCBhbmQgb25seSBjb3VudHMgdXAgZm9yIGRpc2NvbnRpZ3VvdXMKPiA+IG1hcHBpbmdzLCB3aGls
ZSBmc3hhdHRyLm5leHRlbnRzIGNvdW50cyBhbGwgZXh0ZW50IGV2ZW4gaWYgdGhleSBhcmUKPiA+
IGNvbnRpZ3VvdXMuICBTbyB5b3UgcHJvYmFibHkgd2FudCB0byB1c2UgZmlsZWZyYWcgZm9yIGJv
dGggY2FzZXMuCj4KPiBHb3QgaXQg4oCUIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFdl
J2xsIHN3aXRjaCB0byB1c2luZyBmaWxlZnJhZwo+IGFuZCB3aWxsIHNoYXJlIHVwZGF0ZWQgZXh0
ZW50IGNvdW50IG51bWJlcnMgYWNjb3JkaW5nbHkuCgpVc2luZyBmaWxlZnJhZywgd2UgcmVjb3Jk
ZWQgZXh0ZW50IGNvdW50cyBvbiB4ZnMgYW5kIGV4dDQgYXQgdGhyZWUKc3RhZ2VzOgphLiBKdXN0
IGFmdGVyIGEgMUcgcmFuZG9tIHdyaXRlLApiLiBBZnRlciBhIDMwLXNlY29uZCB3YWl0LApjLiBB
ZnRlciB1bm1vdW50aW5nIGFuZCByZW1vdW50aW5nIHRoZSBmaWxlc3lzdGVtLAoKeGZzCkJhc2UK
YS4gNjI1MSAgIGIuIDI1MjYgIGMuIDI1MjYKUGFyYWxsZWwgd3JpdGViYWNrCmEuIDYxODMgICBi
LiAyMzI2ICBjLiAyMzI2CgpleHQ0CkJhc2UKYS4gNzA4MCAgIGIuIDcwODAgICAgYy4gMTEKUGFy
YWxsZWwgd3JpdGViYWNrCmEuIDU5NjEgICBiLiA1OTYxICAgIGMuIDExCgpVc2VkIHRoZSBzYW1l
IGZpbyBjb21tYW5kbGluZSBhcyBlYXJsaWVyOgpmaW8gLS1maWxlbmFtZT0vbW50L3Rlc3RmaWxl
IC0tbmFtZT10ZXN0IC0tYnM9NGsgLS1pb2RlcHRoPTEwMjQKLS1ydz1yYW5kd3JpdGUgLS1pb2Vu
Z2luZT1pb191cmluZyAgLS1mYWxsb2NhdGU9bm9uZSAtLW51bWpvYnM9MQotLXNpemU9MUcgLS1k
aXJlY3Q9MCAtLWV0YS1pbnRlcnZhbD0xIC0tZXRhLW5ld2xpbmU9MQotLWdyb3VwX3JlcG9ydGlu
ZwoKZmlsZWZyYWcgY29tbWFuZDoKZmlsZWZyYWcgIC9tbnQvdGVzdGZpbGUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
