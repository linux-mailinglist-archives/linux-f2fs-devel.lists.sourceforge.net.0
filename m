Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7A29574C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 06:31:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVSFn-00042a-1O; Thu, 22 Oct 2020 04:31:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kVSFk-00042R-Fc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WccrU7y9GtXvSS4lHjkn9vtmXExwGt9W1J4camOQdZw=; b=JeUFNGouR+pyEK+GhvkgMJcsDP
 9mtKOsk3BnRavkPKPJ4H8eUMmzK+IIsdXPB285/Vq+kkSlBupSm3HUEvrkdKPnhheOSuy92TQiv2e
 n3Ee2PL7JB8UbKHwqwA7UFr1x/09o+iqqnLhIj7UkrvozAMV+yI/FX7vwHlMIhTSLgOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WccrU7y9GtXvSS4lHjkn9vtmXExwGt9W1J4camOQdZw=; b=jF/wWaZvu1xTRCish63hNSTXvv
 PdCPO35RBtdZBzN9VxoaJNpgRh9t1cIvKUifbpsIfnzyyRrLOQAZlAEynSNkUFJXI5/NYUOl3w2Q3
 UbdvV/GboYHXenhHEpT/CcHbuEZjbja8uBUPnL1N8jPaP16jcXuE928guySOrRd2sjt4=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVSFi-002BRb-6W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 04:31:04 +0000
Received: by mail-lf1-f65.google.com with SMTP id j30so522636lfp.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Oct 2020 21:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WccrU7y9GtXvSS4lHjkn9vtmXExwGt9W1J4camOQdZw=;
 b=So3a2V6gq3lJWJhOM+LAuRfLWCpK6nhciW4kGooc7P6f9limLQxWvk5X8r0mDoGEFp
 +9y2jIx3fMrVMTayBLUZscbEVP4uUJqDWEkK7qAeDeSLtUSplo5aTSnleSLeuAwkMM2c
 BDQgTRnLR/jW0POXmKgiidJHDvpeYylWUlDnUdYtdXN8SVYRI6wNNMlYGOUpqzUa1uxs
 /KnawegpAYi4KgrK19P6at5Bz3WJ8kvExt27vsb6UbLs2w4WOLJ2/LlfKijTavBAe6mu
 AeYXf3w0jCijzsVHGcdoY5GXsqaWhoA6wZishO4DOiAWX4vIGxKgEONjuIdliOO49/FD
 c3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WccrU7y9GtXvSS4lHjkn9vtmXExwGt9W1J4camOQdZw=;
 b=mjjdezmveL59bTKA3k5x7hr8JSQsvpQ5EPhgV1IOQiRxBjVDPssYWnWBx+7Xk6WTjO
 qJuCTJES7rDH8S6J26ohd0hIKwv93VnKUAvzaSiBQ+3pM0rlwov0A+EoMGU7h1zhmQDv
 4KNBJzd0jEq8PXsIKUvwiTC+GQN/2SVPAN+tFT3gq51WhHQa+k+6W/xK4J1n2Ma4RY6a
 TMiV0eCck5WKkIybbpEtjtsfGcWXunOtPBtqavEg1werHYQyhFQis/sa/j1znqtC3M5Z
 vnkIQ5+Vp4gshiwp+yBjSirvGv3JFhuYDjY7LvkZsgCgDHDQWVt2Gsg4ZKnmdS1fjWkC
 /hSA==
X-Gm-Message-State: AOAM533ffqOUWJNH4DgmFY7uOClQadX0KyfWIoBaoIIpRGmNr6cfrD13
 05PG1W8UvQ1d/lv/itdLLqABMa7CNuv/J8QbqRQ=
X-Google-Smtp-Source: ABdhPJzWoE1r/k/Mo5NARBTN141/Zm8LV2karpbwBQM8VCimIVy7qXrt0UR551kH15zk86yawR1h6CeDg+EZGfgrqYk=
X-Received: by 2002:a05:6512:34cc:: with SMTP id
 w12mr183250lfr.326.1603341047728; 
 Wed, 21 Oct 2020 21:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201022035848.976286-1-daeho43@gmail.com>
 <20201022042257.GA857@sol.localdomain>
In-Reply-To: <20201022042257.GA857@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Oct 2020 13:30:36 +0900
Message-ID: <CACOAw_zVO8FugS_UAXCYyg99-6GWCm4aGi4xEtrhxeBofa2=cA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVSFi-002BRb-6W
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVwLCBpdCBzb3VuZHMgbW9yZSBjbGVhcn4KCjIwMjDrhYQgMTDsm5QgMjLsnbwgKOuqqSkg7Jik
7ZuEIDE6MjIsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISx
Ogo+Cj4gT24gVGh1LCBPY3QgMjIsIDIwMjAgYXQgMTI6NTg6NDdQTSArMDkwMCwgRGFlaG8gSmVv
bmcgd3JvdGU6Cj4gPiArICAgICBpZiAoIWYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+
ID4gKyAgICAgICAgICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgIH0KPgo+IEhvdyBhYm91dCB1c2luZyBFTk9EQVRBIGhl
cmU/ICBFSU5WQUwgdGVuZHMgdG8gYmUgdXNlZCBmb3IgbG90cyBvZiBkaWZmZXJlbnQKPiByZWFz
b25zLCBhbmQgaXQncyBub3QgYWx3YXlzIGNsZWFyIHdoYXQgaXQgbWVhbnMuCj4KPiBOb3RlIHRo
YXQgRlNfSU9DX0dFVF9FTkNSWVBUSU9OX1BPTElDWSBmYWlscyB3aXRoIEVOT0RBVEEgd2hlbiBj
YWxsZWQgb24gYW4KPiB1bmVuY3J5cHRlZCBmaWxlLCB3aGljaCBpcyBhIHNpbWlsYXIgY2FzZS4K
Pgo+IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
