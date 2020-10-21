Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB2294795
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Oct 2020 06:55:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kV6A8-0006K0-Ta; Wed, 21 Oct 2020 04:55:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kV6A7-0006Jp-Tx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMPwfS6F9RfkISbd/IVCeP6a9+iWHhWjZw8peN2d994=; b=cp2DuBbQcwNS7f/u2cDxA11I3j
 n3pqv8xqPkFguvlpAHO3/WDGdm9GbCwDYKjPwyJyYIUUDXDevf/TdZxxy1khu/7ViCVi/E4kkB+LT
 E/q4HwAOcSlZz8sOuexUdtR6yIwDcgh6Vuxnr9rUFQ+1oXIV/bTRKcbn6u9ZYeBDmVsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BMPwfS6F9RfkISbd/IVCeP6a9+iWHhWjZw8peN2d994=; b=KM+5IwyCY+NyUZ2NlUSLNErUgZ
 f7Jhth8ZMznvme22JHc6LI5uBxCz8BJNMQaKysApc8oWbDS+goTx3KpgJJjaOCHC0ZRu2iSck3GMV
 cYlFTWsz5GOAubrCNPh9ZEBMW7yzZxYfruMpwrhxTvSRbHHv1dKKv0bMEc4N19uHgA1c=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kV69u-000fI1-UX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 04:55:47 +0000
Received: by mail-lj1-f195.google.com with SMTP id d24so1013443ljg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Oct 2020 21:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BMPwfS6F9RfkISbd/IVCeP6a9+iWHhWjZw8peN2d994=;
 b=c5A2MIHSXHXxMSgfiDOh6ehXeM5T+QGOlai8e90NTNfQwhzt8CiIZRrqeTiLjxs85a
 elA9zaXYfGqei208XaQ74moAy8bc00iwwrAtouIM5RpQOA2mI61hZb/qyuqJEP29Vxck
 7ux5oNT+nKbZEaS+OwN4akfyScn9U/OUnUFrjcbgM/AGfSe0x2ZuejKYq5l+KIzcYUhN
 evccciPuIwx00D9cWsGLrNVPl5T15fMXBYXy24wr7c1otFtHdvdHK8wjdM6L0zSgr2rf
 iDf9C3uqJbwQLOYZY9z64W9i01yauLMReYqFHLz8KzRR0LApStyhpUTV9uwHt79HtIn6
 dIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BMPwfS6F9RfkISbd/IVCeP6a9+iWHhWjZw8peN2d994=;
 b=qCTApkpSHGPFB7Jd9sXkmJom60cL9zl6kX8jMVvFMrKlry9xAudiGvmmjVBPa2C8UC
 4P6OOoKuW8XshfMlckfvzRu8X+0KUKySeq4P1RWotA4eBLBJJNmGRPE5XHgutOzp0Rk5
 yDvQ85neo/0vM08FFxNMbt6NnXkV+522dOel/jXSZDTuMoodP1zWyfcC6coP/FR4RIxw
 DMlfuTIE2k1C8ae+kDchlAAmZIGCA8oSpejYXk8iaDwVwL0P6s091/Ukr9v+MXf/F9ko
 y3dcMTU+RPorssutIzIBA3zcgwMqalyvq2EhTFwvjzCReCgqFSGqYgLuj6aAOexZCvA3
 AbQg==
X-Gm-Message-State: AOAM53055N61PIf8WrSo54UbUw61uJJjWgzHYl35ZeXZtFCYYj085njj
 4cOzZYqgLSvtnYYnnC2aTkAM7uSX6C87RhEhL14=
X-Google-Smtp-Source: ABdhPJzQhy4cKNyB5zBoB42+eWoKhA4C7mG0JqbircTCE3wFBq/suUYynfIX4sf2BY7qgULmQBPuq3bwZm4B+jf3sYg=
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr582810ljn.166.1603256128177; 
 Tue, 20 Oct 2020 21:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201016051455.1913795-1-daeho43@gmail.com>
 <20201021043620.GA3939@sol.localdomain>
In-Reply-To: <20201021043620.GA3939@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 21 Oct 2020 13:55:17 +0900
Message-ID: <CACOAw_xJ8yTT+PLjgvE_8M6rfuwLiR42EeCOt5xDm2xTDj2Aeg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kV69u-000fI1-UX
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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

Qm90aCB2YWx1ZXMgYXJlIGZyb20gbWVtb3J5IHZhbHVlcy4KCjIwMjDrhYQgMTDsm5QgMjHsnbwg
KOyImCkg7Jik7ZuEIDE6MzYsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5js
nbQg7J6R7ISxOgoKPgo+IE9uIEZyaSwgT2N0IDE2LCAyMDIwIGF0IDAyOjE0OjU1UE0gKzA5MDAs
IERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KPiA+Cj4gPiBBZGRlZCBjb21wcl9pbm9kZSB0byBzaG93IGNvbXByZXNzZWQgaW5v
ZGUgY291bnQgYW5kIGNvbXByX2Jsb2NrcyB0bwo+ID4gc2hvdyBjb21wcmVzc2VkIGJsb2NrIGNv
dW50IGluIHN5c2ZzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2pl
b25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5
c2ZzLWZzLWYyZnMgfCAxMCArKysrKysrKysrCj4gPiAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9B
QkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNm
cy1mcy1mMmZzCj4gPiBpbmRleCA4MzRkMGJlY2FlNmQuLmEwMWMyNjQ4NGM2OSAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4gPiBAQCAtMzUwLDMgKzM1
MCwxMyBAQCBEYXRlOiAgICAgICAgICAgIEFwcmlsIDIwMjAKPiA+ICBDb250YWN0OiAgICAgIkRh
ZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gIERlc2NyaXB0aW9uOiBHaXZl
IGEgd2F5IHRvIGNoYW5nZSBpb3N0YXRfcGVyaW9kIHRpbWUuIDNzZWNzIGJ5IGRlZmF1bHQuCj4g
PiAgICAgICAgICAgICAgIFRoZSBuZXcgaW9zdGF0IHRyYWNlIGdpdmVzIHN0YXRzIGdhcCBnaXZl
biB0aGUgcGVyaW9kLgo+ID4gKwo+ID4gK1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvZnMvZjJm
cy88ZGlzaz4vY29tcHJfaW5vZGUKPiA+ICtEYXRlOiAgICAgICAgICAgICAgICBPY3RvYmVyIDIw
MjAKPiA+ICtDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+ID4gK0Rlc2NyaXB0aW9uOiBTaG93IGNvbXByZXNzZWQgaW5vZGUgY291bnQKPiA+ICsKPiA+
ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2NvbXByX2Jsb2Nrcwo+
ID4gK0RhdGU6ICAgICAgICAgICAgICAgIE9jdG9iZXIgMjAyMAo+ID4gK0NvbnRhY3Q6ICAgICAi
RGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiArRGVzY3JpcHRpb246IFNo
b3cgY29tcHJlc3NlZCBibG9jayBjb3VudAo+Cj4gSXMgaXQgdGhlIGNvdW50IGluIG1lbW9yeSwg
b3Igb24gZGlzaz8KPgo+IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
