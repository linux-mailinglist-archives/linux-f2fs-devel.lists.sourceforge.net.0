Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BBA3911CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 10:02:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lloV1-0003DF-9o; Wed, 26 May 2021 08:02:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <lee.jones@linaro.org>) id 1lloV0-0003D9-L6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 08:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKYMHuHj0rbRUvGsShexdweEmy0NImIy2gA8dj6fkuE=; b=OXjZyPyE8szdfS5OVhFQbV6dEr
 34GASimgsxcWwxXuwicAdU8QKhlzU1Ip6OMehYv5/Sr77LRG9uSmDV8NvL/ZXX+B/QkqoezTo6yH/
 9Jcier+9gOr32FG8vKSG0LCtuPPtfCJ37ECGgmIbtMV2Pp3mGyltYAosHIiwqHB7lrdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QKYMHuHj0rbRUvGsShexdweEmy0NImIy2gA8dj6fkuE=; b=bYLS2Jc/UVexz+OhoxdrjYmSTs
 +NJd/JhrSYm1m291VRD4gCNZ+qPNfTwLBIgeVrIQeYKjodeMspY+I6fK7s2q7zubFaATNVxycMTqH
 zypRCznNSLpR+wwvB5AyZhh4+XZpcS4boCD5N2BgXIXyrzF4bX+2mPpjxuVWwUkOS8No=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lloUq-006FTs-VA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 08:02:43 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so396918wme.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 May 2021 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QKYMHuHj0rbRUvGsShexdweEmy0NImIy2gA8dj6fkuE=;
 b=T5q7OTy6oO8Uxl4kJVPH+6k/22Oq4u5P5Syiyrm8N0Kkyl8yxvHJdzDg+3eN/NxRBd
 WFBgJEUvgpwQcSqbSbtepgsp6dCbHn3dD2+MR1kvmhmpVmSqDVOGAlGiT57y4is4cVKs
 kHbmcqWUi6HRepE51rTn7K+2enZHmTPlkL+Q2x4FhF3CPkZkJg8WQYnUQD6aqC/eWcp8
 soGqlEfvI00R3esiCgOJkykUeB1HizxPgfxD4BYr9CWoTtkuhagdPwb8F00WNQrHSRXP
 UETyn+MIeQvCxDco5L7UsXru93iZnIPVVTDYhug9eEhb4MUAJ/dec73GEj3k0XZmY84x
 etWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QKYMHuHj0rbRUvGsShexdweEmy0NImIy2gA8dj6fkuE=;
 b=BSzc6nqdi6hhKvaCoFT1N5ltSuQ7ad6XN5c5jnJ+RPMz668fUV2GUK64dGEAhhrDsW
 a2/uTB1IxOQBJPYFehx4VuDEhY6YRlKLCMMsLCupUI0aTdinARDE+Cw8BLHnXK5VCO9W
 +bnnMlgA4FQdReyzNLOHswXh62FpfFLvM9n23N8s/LfsvqtzTeLuGH2l3K4cJBWRUYy1
 wGw+a1uV0ueYF0QQc9MSAoa5IIM2wyzx7K28+3LffYVhPmKmMhrlnA1m5VEMZY/RX0fh
 lUEl+aQJW1uVIvid/DBIWWRnVQhI4my3yMhmjg1beURyXYE495Jss7fWcwUA0lPGmwaO
 a8fw==
X-Gm-Message-State: AOAM531vOOsOQ8nrTPt+9UYed105RowJzDsqj463hdwdGNvfBlmRqzfZ
 3ynmrBi13td/H0kMknnSmhpADA==
X-Google-Smtp-Source: ABdhPJwrEx+pejVdZrENSeUjbsMmHQqcH7okPp5KpG7TvcFBGPoRuHHoqjtEN+zZbUOLp+4rBgmJNQ==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr2146740wmb.51.1622016146591; 
 Wed, 26 May 2021 01:02:26 -0700 (PDT)
Received: from dell ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l13sm5033812wrv.57.2021.05.26.01.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:02:26 -0700 (PDT)
Date: Wed, 26 May 2021 09:02:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20210526080224.GI4005783@dell>
References: <20210121230336.1373726-1-satyat@google.com>
 <CAF2Aj3jbEnnG1-bHARSt6xF12VKttg7Bt52gV=bEQUkaspDC9w@mail.gmail.com>
 <YK09eG0xm9dphL/1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YK09eG0xm9dphL/1@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.43 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lloUq-006FTs-VA
Subject: Re: [f2fs-dev] [PATCH v8 0/8] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 open list <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCAyNSBNYXkgMjAyMSwgU2F0eWEgVGFuZ2lyYWxhIHdyb3RlOgo2NTs2MjAwOzFjCj4g
T24gVHVlLCBNYXkgMjUsIDIwMjEgYXQgMDE6NTc6MjhQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gT24gVGh1LCAyMSBKYW4gMjAyMSBhdCAyMzowNiwgU2F0eWEgVGFuZ2lyYWxhIDxzYXR5
YXRAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBz
dXBwb3J0IGZvciBkaXJlY3QgSS9PIHdpdGggZnNjcnlwdCB1c2luZwo+ID4gPiBibGstY3J5cHRv
Lgo+ID4gPgo+ID4gCj4gPiBJcyB0aGVyZSBhbiB1cGRhdGUgb24gdGhpcyBzZXQgcGxlYXNlPwo+
ID4gCj4gPiBJIGNhbid0IHNlZW0gdG8gZmluZCBhbnkgcmV2aWV3cyBvciBmb2xsb3ctdXAgc2lu
Y2Ugdjggd2FzIHBvc3RlZCBiYWNrIGluCj4gPiBKYW51YXJ5Lgo+ID4gCj4gVGhpcyBwYXRjaHNl
dCByZWxpZXMgb24gdGhlIGJsb2NrIGxheWVyIGZpeGVzIHBhdGNoc2V0IGhlcmUKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1ibG9jay8yMDIxMDMyNTIxMjYwOS40OTIxODgtMS1zYXR5
YXRAZ29vZ2xlLmNvbS8KPiBUaGF0IHNhaWQsIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gYWN0aXZl
bHkgd29yayBvbiBib3RoIHRoZSBwYXRjaHNldHMKPiBmb3IgYSB3aGlsZSwgYnV0IEknbGwgc2Vu
ZCBvdXQgdXBkYXRlcyBmb3IgYm90aCBwYXRjaHNldHMgb3ZlciB0aGUKPiBuZXh0IHdlZWsgb3Ig
c28uCgpUaGFua3MgU2F0eWEsIEknZCBhcHByZWNpYXRlIHRoYXQuCgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
