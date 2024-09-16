Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EE97A7DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 21:42:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqHc5-0004Go-4U;
	Mon, 16 Sep 2024 19:42:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sqHc3-0004Gg-0U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 19:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=48Dwuywvpu+376I64Njgm4MhfpcWjXwvY7We0S1xdxA=; b=BjzZTsdSzWuF4Z+LxP6KJCwMrH
 VRA/rJv7QyDKJzC2Jb5aNxNLGJ7Jr2P9gNOAzHIjv+GgXgehAlNUajsjPgG/fGBhR0n3joliIFV/d
 hZ/qKvnPeQVh1ncjKgt3d2MqhKww4LIHtht60fPK8lCEzACS2EMpj/vsAIk8LIeQZBRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=48Dwuywvpu+376I64Njgm4MhfpcWjXwvY7We0S1xdxA=; b=Xnrpyh3/oVVHqZ4pzb/A61GTq1
 YuPLfvHAkNWJsiSwYOKY2NK0uNs2VrFzWzczgv0fVss3xLum5566Yhf9vLjktaN/muMQZQPINo1rO
 iEh8JeiKEeuQPrZMFUKyohTv2hrdGpYYU19sLWjsOo8WyNysHTcsKsXRcm2ipGDlJGJc=;
Received: from mail-vk1-f169.google.com ([209.85.221.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sqHc1-0002e8-Pd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 19:42:18 +0000
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-502c8f50c5dso1078848e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Sep 2024 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726515727; x=1727120527; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=48Dwuywvpu+376I64Njgm4MhfpcWjXwvY7We0S1xdxA=;
 b=l7p4m8P2gpbE3Aeq82BHB5hqfNuJ+Yc52EuLge85gUHXkwKwAoTX5SvgfeE21bBN0h
 2Kn6ArfM8LEkb8Ep2mnBqlsnGS8X3DQYjpGxLF69mIR7WD0PSTX+cp1x6oNCCxpkPRni
 uD9pTbZWcrMEquq+/b9clYQqAbQCzmOe55W/Q+JlTxKB99PbZrXsvGHlLffY3E4+TGl2
 NXwxb2OLv9xhdOmLG+YH1iOyy2iq2eHyht0wxDor6zPejir+nqmim9if61+CvI3Ij8S5
 +01J/+UXw/hQKQayy5GfOqGtRtM0aMH09SYZw/VGFlKc7gLa8viI3RPZR4bMQiP4Cu6v
 RuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726515727; x=1727120527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48Dwuywvpu+376I64Njgm4MhfpcWjXwvY7We0S1xdxA=;
 b=imlY/mB92JTw5g72qleUlMytrIhgcabt3aUKbP9L7GWCgCc62BBBxNNZDm1IAWAVHX
 KwiWFQOBWzLkokLlof2uwQStueEyKxyOPULPdu8aywCdwFXm7zP/8yWnEp6xPjnVTKde
 8wYzlJWOwcCuzE06/ZhAv2+xYIu+6NVs7QBvOaR4DAqukDM1HFLfBU0Nm4UTFpDOiH3c
 pSsO6bHctHBjLHhkmhFp0b52mFQCANE25DF0VrUZN1TU/VbG9Reia1LfBoI/G7h2gib6
 hsdPwEC4+9Bz5X2rLFjDeRvh0nWUW34H9jDdaSx26ga4IPCoTpmhI47ITzWbobwumAuo
 Kwiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKTp4hdOmk2hr8zWVVpdKjsrGNpBSPIl31JyZiQvQtfUhUmUt8ssyjp0wQcH5hb6sAvGfu3HOan6yP9ELUbXQM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwAvDVUVJi+8FkhGEMmeN1F/0oNMD/UWjcQDDyR5qLkwrdco5ub
 MizvJxyGcQHKU7CGXyYuUkrqREzik3AKBFmFw4DfwrcujOhLNxI9298QAa7jWoQIk9RGGFrQnVg
 TtxnjknTWpBJihUFWReTpR8viUfWMOpsI
X-Google-Smtp-Source: AGHT+IFbRRZGxTNbY/i7l1nnR/42puJIS9fpYBehSpAyUW8Agf+I7MI6GRpdyiE0Ln84sgKD2fifqTGiuWSJNo7GLXM=
X-Received: by 2002:a05:6122:1306:b0:4f5:254e:e111 with SMTP id
 71dfb90a1353d-5032d40e6a1mr11439114e0c.7.1726515726603; Mon, 16 Sep 2024
 12:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240915032251.2300459-1-jaegeuk@kernel.org>
In-Reply-To: <20240915032251.2300459-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 16 Sep 2024 12:41:55 -0700
Message-ID: <CACOAw_zeAYOc9wgD6O5cOLR+Q54aA6=9+-zefTEe71RSaqGoYQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Sep 14, 2024 at 8:24 PM Jaegeuk Kim via Linux-f2fs-devel
    wrote: > > This patch allows f2fs to submit bios of in-place writes on pinned
    file. > > Signed-off-by: Jaegeuk Kim > --- > fs/f2f [...] 
 
 Content analysis details:   (-1.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.169 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1sqHc1-0002e8-Pd
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow F2FS_IPU_NOCACHE for pinned file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBTZXAgMTQsIDIwMjQgYXQgODoyNOKAr1BNIEphZWdldWsgS2ltIHZpYSBMaW51eC1m
MmZzLWRldmVsCjxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6
Cj4KPiBUaGlzIHBhdGNoIGFsbG93cyBmMmZzIHRvIHN1Ym1pdCBiaW9zIG9mIGluLXBsYWNlIHdy
aXRlcyBvbiBwaW5uZWQgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZzL2YyZnMvc3lzZnMuYyB8IDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiBpbmRleCBkMTg5MzFiN2IwOTQu
LmM1NmU4Yzg3MzkzNSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiArKysgYi9mcy9m
MmZzL3N5c2ZzLmMKPiBAQCAtNzkyLDcgKzc5Miw4IEBAIHN0YXRpYyBzc2l6ZV90IF9fc2JpX3N0
b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gICAgICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5h
bWUsICJpcHVfcG9saWN5IikpIHsKPiAgICAgICAgICAgICAgICAgaWYgKHQgPj0gQklUKEYyRlNf
SVBVX01BWCkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gLSAg
ICAgICAgICAgICAgIGlmICh0ICYmIGYyZnNfbGZzX21vZGUoc2JpKSkKPiArICAgICAgICAgICAg
ICAgLyogYWxsb3cgRjJGU19JUFVfTk9DQUNIRSBvbmx5IGZvciBJUFUgaW4gdGhlIHBpbm5lZCBm
aWxlICovCj4gKyAgICAgICAgICAgICAgIGlmIChmMmZzX2xmc19tb2RlKHNiaSkgJiYgKHQgJiB+
QklUKEYyRlNfSVBVX05PQ0FDSEUpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAgICAgICAgICAgICAgICAgU01fSShzYmkpLT5pcHVfcG9saWN5ID0gKHVuc2ln
bmVkIGludCl0Owo+ICAgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gLS0KPiAyLjQ2LjAu
NjYyLmc5MmQwODgxYmIwLWdvb2cKPgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2pl
b25nQGdvb2dsZS5jb20+CgpUaGFua3MsCgoKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
