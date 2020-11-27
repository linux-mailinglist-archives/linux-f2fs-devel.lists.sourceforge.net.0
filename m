Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 586362C5E79
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Nov 2020 01:31:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kiRfa-0006Zt-LW; Fri, 27 Nov 2020 00:31:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kiRfZ-0006ZZ-8y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Nov 2020 00:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrO6oiIS1I2DeZeWVb/81GGT/01B9WvFB73uagPOMiA=; b=SbSTgnkcYLEY+9ga2dtLoIKTur
 hTqtgHyX5m3LRbdVIDQrcuQvfOuG4vlRGIxp/OFHjxCES/MbY4HURgG0HsS4JLfmT1KYI66NMJEyk
 lixBTInMQ1niGD0QWlmcGBSeknVlYmrGez+CHY+J6TRKXwZ2rsXW5J4t0JgvZ3NRjXyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrO6oiIS1I2DeZeWVb/81GGT/01B9WvFB73uagPOMiA=; b=HvKstTos920pnA3+IExGWb3Krg
 JIt0YUytKMtm6pmGI6GjC08eni5r6yB2PwghvELGLE6hucKhqF0GG9/M5mhEK4m9Fl9ur9ZKk3cz5
 ahl0q+0un0vcEsT20StqtKwGmpeUs9R3+Pwq6lnxpbNN2lYI8uhPGbzjOEm4e+wv3nu0=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kiRfS-0066FJ-5o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Nov 2020 00:31:25 +0000
Received: by mail-lf1-f65.google.com with SMTP id s30so4764608lfc.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Nov 2020 16:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RrO6oiIS1I2DeZeWVb/81GGT/01B9WvFB73uagPOMiA=;
 b=CSImSj4VXCDoV3bNJRk4tZN4naszBmYhls5ZY4BYU6Em/VLZC3/G6EKZlEdJv0jTs1
 CXae/5jsQO9EeuVRuKhFv+4stFaZbjnQK/GIp2adM9jAPMQjZAUbl5piyrCyb+TbXoUw
 qvgWtUyEhkzuRzg2HHLo+pgNFK69V7AeoW/jUZPafF9Key7HYJRCyQHIb4d+tI9O0/E+
 h5YE3dBGlgeIew4pUsx1lcT0Mwh1ssBE09iAg/bfEyJrYgw9HbfkrlC198Wy2VwLMqTv
 F5Pf05s2I+z94N6F+u6DqgNtPpAJH/SuhrrEtCcaVtxgxwyC2bS86opehCYVS325vupD
 2JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RrO6oiIS1I2DeZeWVb/81GGT/01B9WvFB73uagPOMiA=;
 b=W7X8/wLmQ9VQuadOXafRjKh6VXs0Wd+niPfjlBmdqz89YM4I6kvTjSefYXxLBuzASO
 ua4nLw+n4j/Dcu+ZKozYx845uy5OuZKu/7e+dN5VLLvNfedBUJE4wOSG7JTrQSVKK4Ng
 cEKYkMmcN/Uvu3TJ5n9FRawPoVi6c62ZiDLUTdxj8+fR9+h8Wwu6/KG7O9T5Qi4jotdx
 CgXLpXOy3JXfDLRQM58SQiXo4wl4lSub5HMUwGZsbw4/eEvn+eqnslI5gvkVOqeqYxO5
 RebDQwRpZJPAhBwcXUkK+LI9XJaS3rzyx0uNqQSYC7UiQxqkcPkhv7LUfT6ULRpcdDsg
 qMOg==
X-Gm-Message-State: AOAM532V9r4c6a4idSbXCkUWNYO8s5b4WSghjl+zrY//utbLy4nHglD7
 ojMNtZHCyhtP3piMF3L3LZWyL/DzmjmTrG+msJY=
X-Google-Smtp-Source: ABdhPJx4EcyHZbHeHj47vWxjXYU76LDEhUFsmEfyv8X3fCCeMXHqo3ShzAaEZb5lH+2EcbAlKa8e51BSLP6RaSdKcgA=
X-Received: by 2002:a19:7dc4:: with SMTP id y187mr489182lfc.326.1606437064274; 
 Thu, 26 Nov 2020 16:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
 <5b3cb83d-5d0f-c1ca-2cff-f28372dec48e@huawei.com>
 <CACOAw_xs0dizV_xg4-8ssC8wPRq8eXPw3QhHAFf3S-w3hp9jcg@mail.gmail.com>
 <X7/qr/kVxl3AO/PR@sol.localdomain>
 <CACOAw_xaJ6pfT_EDqCSaL8UnBVkktXK5N_GXuHT+xzu1ufVacg@mail.gmail.com>
In-Reply-To: <CACOAw_xaJ6pfT_EDqCSaL8UnBVkktXK5N_GXuHT+xzu1ufVacg@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 27 Nov 2020 09:30:53 +0900
Message-ID: <CACOAw_wyGrkadW5Z6F_GEGT217q4+=68T0cVjnqx-DKx9HYvDw@mail.gmail.com>
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
X-Headers-End: 1kiRfS-0066FJ-5o
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmUtdGhpbmtpbmcgYWJvdXQgdGhpcywgcGFnZV9jYWNoZV9zeW5jX3JlYWRhaGVhZCgpIGlzIG5v
dCBnb29kIGZvcgpvdXIgc2l0dWF0aW9uLCBpdCBtaWdodCBlbmQgdXAgd2l0aCBjbHVzdGVyIG1p
c2FsaWduZWQgcmVhZHMgd2hpY2gKdHJpZ2dlciBpbnRlcm5hbCBkdXBsaWNhdGVkIGNsdXN0ZXIg
cmVhZHMuCgoyMDIw64WEIDEx7JuUIDI37J28ICjquIgpIOyYpOyghCA4OjQ2LCBEYWVobyBKZW9u
ZyA8ZGFlaG80M0BnbWFpbC5jb20+64uY7J20IOyekeyEsToKPgo+IENoYW8sCj4KPiBHb3QgaXR+
Cj4KPiBFcmljLAo+Cj4gQWN0dWFsbHksIEkgd2FudGVkIHRvIGRldG91ciB0aGUgaW50ZXJuYWwg
cmVhZGFoZWFkIG1lY2hhbmlzbSB1c2luZwo+IHBhZ2VfY2FjaGVfcmFfdW5ib3VuZGVkKCkgdG8g
Z2VuZXJhdGUgY2x1c3RlciBzaXplIGFsaWduZWQgcmVhZAo+IHJlcXVlc3RzLgo+IEJ1dCwgcGFn
ZV9jYWNoZV9hc3luY19yZWFkYWhlYWQoKSBvciBwYWdlX2NhY2hlX3N5bmNfcmVhZGFoZWFkKCkg
Y2FuCj4gYmUgYWxzbyBnb29kIGVub3VnaCwgc2luY2UgdGhvc2UgY2FuIGNvbXBlbnNhdGUgZm9y
IHRoZSBtaXNhbGlnbmVkCj4gcmVhZHMgcmVhZGluZyBtb3JlIHBhZ2VzIGluIGFkdmFuY2UuCj4K
PiBUaGFua3MsCj4KPiAyMDIw64WEIDEx7JuUIDI37J28ICjquIgpIOyYpOyghCAyOjQ5LCBFcmlj
IEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiA+Cj4gPiBPbiBU
aHUsIE5vdiAyNiwgMjAyMCBhdCAwMjowNDo0MVBNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+ID4gRXJpYywKPiA+ID4KPiA+ID4gZG9fcGFnZV9jYWNoZV9yYSgpIGlzIGRlZmluZWQgaW4g
bW0vaW50ZXJuYWwuaCBmb3IgaW50ZXJuYWwgdXNlCj4gPiA+IGJldHdlZW4gaW4gbW0sIHNvIHdl
IGNhbm5vdCB1c2UgdGhpcyBvbmUgcmlnaHQgbm93Lgo+ID4gPiBTbywgSSB0aGluayB3ZSBjb3Vs
ZCB1c2UgcGFnZV9jYWNoZV9yYV91bmJvdW5kZWQoKSwgYmVjYXVzZSB3ZSBhbHJlYWR5Cj4gPiA+
IGNoZWNrIGlfc2l6ZSBib3VuZGFyeSBvbiBvdXIgb3duLgo+ID4gPiBXaGF0IGRvIHlvdSB0aGlu
az8KPiA+Cj4gPiBXaGF0IGFib3V0IHBhZ2VfY2FjaGVfYXN5bmNfcmVhZGFoZWFkKCkgb3IgcGFn
ZV9jYWNoZV9zeW5jX3JlYWRhaGVhZCgpPwo+ID4KPiA+IC0gRXJpYwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
