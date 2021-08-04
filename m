Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FE3DFCCB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 10:26:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBCEW-0001sX-Bd; Wed, 04 Aug 2021 08:26:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <lee.jones@linaro.org>) id 1mBCET-0001sL-RS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 08:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wshwpEouxlj43w/LQBqY2ZUR+r5ng5wTSfjhEdV7ZQ8=; b=C6UrLKfPCyaKEBccO0oZcfvc82
 p353RCrFSTDx51lZeXBM4/UOZN8OU8MCa2fb6Z+is6Tq3ajudARgdaqiEx7NByqUUedC7vOHn1ypR
 kFLIaKknf9RBkSgrLE7i3yTVlbv49hih/mQ0HneEshZUYkK8dPCri1XIwPtyVnN83+fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wshwpEouxlj43w/LQBqY2ZUR+r5ng5wTSfjhEdV7ZQ8=; b=E7Gw2Liw5Aeum8ZRQuf9jPIHAk
 MJ3YNKkR9EqE7D24Bsduv2NpFVlbZe7rpPGLS/Re0M/4211oqGM9JVyU+yGcNGqAnIUxijgam9Uas
 5GTQi/zrlCoZZ3dddgau6mS+OJRLH4skyFC0cQhwaMEhQh2BNGd+XSIrsfNqwrkooBjk=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBCEK-00Br5y-H7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 08:26:33 +0000
Received: by mail-wm1-f41.google.com with SMTP id k4so685972wms.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Aug 2021 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wshwpEouxlj43w/LQBqY2ZUR+r5ng5wTSfjhEdV7ZQ8=;
 b=REbwzykdm7OHhYkHKTa4GjtmoAm/i/ozHj6HEKSDN2l8DI9yMhJjoD3frpiGcgtfuf
 B6k4/3bLIv/vNdP6tho5LYyF0rZUupRmPJCOued8whJH/JUG2rWSdfbelUmXEH/ZI/v+
 2SflUax0cVIuf5qFUmtGeSjNmD177hOaOC1u31X3/1MZEBQLCJRSwk6AwezncWp08aGl
 Rz6HuxNepkU8dv72WwgMjJnDtKHfA1zczbGIhz4JCvDjHDc/zxSFeRsjxGheGvW8bTGG
 jsYxYwMJy8H34keULSi4tRMVafjaS+eTGn93fl/EP8YVVkhsVZxL9hp4Hl8UgT+5kuWC
 DtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wshwpEouxlj43w/LQBqY2ZUR+r5ng5wTSfjhEdV7ZQ8=;
 b=I5sP/Cm8JCqvL9IiBCSI2VERzoy9MHMjJDnKB8rpv+ZO4qxgp1JiyLWYtWHy0i3Dp3
 mv3+3wgPAQ9B5JCMG21GbIxxqqp0XmBcOWs2CnLMlz6HzyGCrsFcvY3w6YaOFCORLTmQ
 BbiMRNTPRsVN7onSZnlzQIc0p6izOhsmqZf4yzRaURJCVGuaB4axS3Pg8M0A1fn8z4F8
 +xDeGXkUxRYDI5371ajR9ld+4QMZQ1T2x8FgNj53gdvfqS498YBjYoNag2VycKOQZaO3
 0AhQSqPrTSb1kr7jxBAwTqDJ362EZyH4uj78Qj4S2EpJ2K+BlX4co1PdSveYCvLNmeHT
 NcwA==
X-Gm-Message-State: AOAM531HONwcDz5/wF2y6T1kap2tPBvlIMtX1h66nAzkiYfA1yWYIHUt
 DxxrMxCk5nKPOX4OnYTleBCqsQ==
X-Google-Smtp-Source: ABdhPJxSza4YTAHvrQmEe3o94FSosfOKLqFVTx3EseeNpvxzLFtyvsyQMNLyS8I4Tj4Yqe7BtrbYsA==
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr26665661wmj.169.1628065578184; 
 Wed, 04 Aug 2021 01:26:18 -0700 (PDT)
Received: from google.com ([109.180.115.228])
 by smtp.gmail.com with ESMTPSA id j6sm5060494wmq.29.2021.08.04.01.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:26:17 -0700 (PDT)
Date: Wed, 4 Aug 2021 09:26:15 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YQpPJ8To7NN2AIuq@google.com>
References: <20210604210908.2105870-1-satyat@google.com>
 <CAF2Aj3h-Gt3bOxH4wXB7aeQ3jVzR3TEqd3uLsh4T9Q=e6W6iqQ@mail.gmail.com>
 <YPmFSw4JbWnIozSZ@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPmFSw4JbWnIozSZ@gmail.com>
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.41 listed in list.dnswl.org]
 2.9 FSL_HELO_FAKE          No description available.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mBCEK-00Br5y-H7
Subject: Re: [f2fs-dev] [PATCH v9 0/9] add support for direct I/O with
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCAyMiBKdWwgMjAyMSwgRXJpYyBCaWdnZXJzIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
T24gVGh1LCBKdWwgMjIsIDIwMjEgYXQgMTI6MjM6NDdQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gCj4gPiBObyByZXZpZXcgYWZ0ZXIgNyB3ZWVrcyBvbiB0aGUgbGlzdC4KPiA+IAo+ID4g
SXMgdGhlcmUgYW55dGhpbmcgU2F0eWEgY2FuIGRvIHRvIGhlbHAgZXhwZWRpdGUgdGhpcyBwbGVh
c2U/Cj4gPiAKPiAKPiBUaGlzIHNlcmllcyBpcyBiYXNpY2FsbHkgcmVhZHksIGJ1dCBJIGNhbid0
IGFwcGx5IGl0IGJlY2F1c2UgaXQgZGVwZW5kcyBvbiB0aGUKPiBvdGhlciBwYXRjaCBzZXJpZXMK
PiAiW1BBVENIIHY0IDAvOV0gZW5zdXJlIGJpb3MgYXJlbid0IHNwbGl0IGluIG1pZGRsZSBvZiBj
cnlwdG8gZGF0YSB1bml0Igo+IChodHRwczovL2xrbWwua2VybmVsLm9yZy9saW51eC1ibG9jay8y
MDIxMDcwNzA1Mjk0My4zOTYwLTEtc2F0eWFwcmF0ZWVrMjM1N0BnbWFpbC5jb20vVC8jdSkuCj4g
SSB3aWxsIGJlIHJlLXJldmlld2luZyB0aGF0IG90aGVyIHBhdGNoIHNlcmllcyBzb29uLCBidXQg
aXQgcHJpbWFyeSBuZWVkcyByZXZpZXcKPiBieSB0aGUgcGVvcGxlIHdobyB3b3JrIG1vcmUgcmVn
dWxhcmx5IHdpdGggdGhlIGJsb2NrIGxheWVyLCBhbmQgaXQgd2lsbCBoYXZlIHRvCj4gZ28gaW4g
dGhyb3VnaCB0aGUgYmxvY2sgdHJlZSAoSSBjYW4ndCBhcHBseSBpdCB0byB0aGUgZnNjcnlwdCB0
cmVlKS4KPiAKPiBUaGUgb3JpZ2luYWwgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyBkaWRuJ3QgcmVx
dWlyZSBzbyBtYW55IGJsb2NrIGxheWVyIGNoYW5nZXMsCj4gYnV0IGl0IHdvdWxkIGhhdmUgb25s
eSBhbGxvd2VkIGRpcmVjdCBJL08gd2l0aCB1c2VyIGJ1ZmZlciBwb2ludGVycyBhbGlnbmVkIHRv
Cj4gdGhlIGZpbGVzeXN0ZW0gYmxvY2sgc2l6ZSwgd2hpY2ggd2FzIHRvbyBjb250cm92ZXJzaWFs
IHdpdGggb3RoZXIgZmlsZXN5c3RlbQo+IGRldmVsb3BlcnM7IHNlZSB0aGUgbG9uZyBkaXNjdXNz
aW9uIGF0Cj4gaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvbGludXgtZnNjcnlwdC8yMDIwMDcyMDIz
MzczOS44MjQ5NDMtMS1zYXR5YXRAZ29vZ2xlLmNvbS9ULyN1Lgo+IAo+IEluIGFkZGl0aW9uLCBp
dCB3YXMgcmVxdWVzdGVkIHRoYXQgd2Ugbm90IGFkZCBmZWF0dXJlcyB0byB0aGUgImxlZ2FjeSIg
ZGlyZWN0Cj4gSS9PIGltcGxlbWVudGF0aW9uIChmcy9kaXJlY3QtaW8uYyksIHNvIEkgaGF2ZSBh
IHBhdGNoIHNlcmllcyBpbiBwcm9ncmVzcwo+ICJbUEFUQ0ggMC85XSBmMmZzOiB1c2UgaW9tYXAg
Zm9yIGRpcmVjdCBJL08iCj4gKGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2
ZWwvMjAyMTA3MTYxNDM5MTkuNDQzNzMtMS1lYmlnZ2Vyc0BrZXJuZWwub3JnL1QvI3UpCj4gd2hp
Y2ggd2lsbCBjaGFuZ2UgZjJmcyB0byB1c2UgaW9tYXAuCj4gCj4gQWxzbyBwbGVhc2UgdW5kZXJz
dGFuZCB0aGF0IFNhdHlhIGhhcyBsZWZ0IEdvb2dsZSwgc28gYW55IGZ1cnRoZXIgd29yayBmcm9t
IGhpbQo+IG9uIHRoaXMgaXMgaGFwcGVuaW5nIG9uIGEgcGVyc29uYWwgY2FwYWNpdHkgaW4gaGlz
IGZyZWUgdGltZS4KClRoYW5rcyBmb3IgdGhlIHVwZGF0ZSBFcmljLiAgSSdsbCBwdXNoIHRoaXMg
dG8gdGhlIGJhY2sgb2YgbXkgcXVldWUKYW5kIGNoZWNrIGJhY2sgd2l0aCB5b3UgYXQgYSBsYXRl
ciBkYXRlLiAgSG9wZWZ1bGx5IHdlIHNlZSBzb21lCmludGVyZXN0IGZyb20gdGhlIG90aGVyIG1h
aW50YWluZXJzIHNvb25lciwgcmF0aGVyIHRoYW4gbGF0ZXIuCgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
