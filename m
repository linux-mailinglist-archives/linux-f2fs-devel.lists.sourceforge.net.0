Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D46067128E8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 16:48:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2Yjh-00055y-Rz;
	Fri, 26 May 2023 14:48:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1q2WJz-0003bF-PK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 12:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tcRKotHm11Cr8qUj3/GWYcYV61NEa/MLisov9OVu4ms=; b=LLlWpBUjaDvO9NZD/+8p9N02vr
 dcvpv8Lz0ikSJx0ocJU+KxJVaWh11oNX+TLcJT9pqtsC4RfMnQa3gv/zkaLVbYchkER0yL0TOP4zc
 /ZgjlArDXNByrlCIJRVY972iicmW/XwEtc4GM2Gya+MPYq2YffVYxmejnoj7JphDc5vo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tcRKotHm11Cr8qUj3/GWYcYV61NEa/MLisov9OVu4ms=; b=Ots94Xwzx8iYYN0h0UXLqi52Ii
 B6NoGo/C4Sk1K+QMHhldl3FUJ3ImeRpts9vppltoPET6+yFJ3OktEyjk+TTKrLE0opeupzzDo7yQU
 wg2vPvzHnKKDJ1Xxfs9Q54p/xVtAYQVCHFtvn3iqNViLrpProY1AuVr7EV2CO7lBejR4=;
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2WJv-0008Uw-L0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 12:13:28 +0000
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so187432241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685103198; x=1687695198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcRKotHm11Cr8qUj3/GWYcYV61NEa/MLisov9OVu4ms=;
 b=qNJVBcO0pgHk1FtxZZZInxG5XdghYq7HW2ekZSNyUQKTTieVyOCgSQa5g6QfgxAXWF
 iIs7lRqeZCDwFbkve3kKHr9GsFUj+d35A5TRs7wO415HxBqGDGT95xEufzLk/Sa1RXGk
 lB7Wrb+zVHQ10S32Geo1slxl2hH6pKR3lJ4CD5uFKCeVSnzlcY3bWA+tnKor4r/5U5g3
 BE93yg4DE21BXoVnRKhW/JbF37e3FVKkdGs/LhFb6lx2FqFEPKXvR6IAYjCQn8XcEpVV
 uyUeEcnXATJBcn5bk4BW/Mrr6TxBU05movLQG5wkaep6Un+LO0pXOwrLpOCvqf7Tgynv
 Ihsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685103198; x=1687695198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcRKotHm11Cr8qUj3/GWYcYV61NEa/MLisov9OVu4ms=;
 b=fKo3wSPI/dyGHsllr5QZSiAL1a/z/iCLlGzSnwPDEV9f5iPkrKRUvl9CGwccmiLwae
 cweZsDjxodB3bcxnSmKfMZfoNcFB0nRMg4qgIfAlRTgEc/xNhKv4vJ/B/uAOS/K2y54m
 gIULu/DgAsnOLDCYs+fo8wXqPexUBfysPh+d4KFeYqlN4A6Ty6On+L8KuXaRMRvzP2r7
 fJTix3PkeZjRbUVNJPh3tF5A3LVXy9plNNTTjLG0CJF3nNXOwqQwTyF6S8QZQS1YBnZt
 YzfUQRmgl0ZTSjzzeAtgItip3qOgGvXMAx/8ADuh5fw1U5pdeQxGStgmcRC/zMlGG7Tg
 bBPw==
X-Gm-Message-State: AC+VfDywKECNuWf3ZVkqBfLlyAOFJaspkp9aYo/5yQ6Qgyy9/cUX+uYy
 riGbiyVN+rQVGNKS94slI06YqyAikG9uJBtu52E=
X-Google-Smtp-Source: ACHHUZ65ecGR6Dzg9pcCYcUOIL+cztRir6Po2LaPk6wm4K318CXvLnjQsqidAmmm+l52h3OiA8iZpjdjHa+3MI8cCXs=
X-Received: by 2002:a67:f554:0:b0:439:40d7:c66f with SMTP id
 z20-20020a67f554000000b0043940d7c66fmr346571vsn.14.1685103197744; Fri, 26 May
 2023 05:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230525100654.15069-1-jack@suse.cz>
 <20230525101624.15814-6-jack@suse.cz>
In-Reply-To: <20230525101624.15814-6-jack@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 26 May 2023 15:13:06 +0300
Message-ID: <CAOQ4uxhL0w+yqg2u_xW6r4J_gJX=_zoZjo3vh0ONqAbgxm2VTA@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, May 25, 2023 at 1:17 PM Jan Kara wrote: > > Currently
    lock_two_nondirectories() is skipping any passed directories. > After vfs_rename()
    uses lock_two_inodes(), all the remaining four user [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.50 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q2WJv-0008Uw-L0
Subject: Re: [f2fs-dev] [PATCH 6/6] fs: Restrict lock_two_nondirectories()
 to non-directory inodes
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
Cc: Christian Brauner <brauner@kernel.org>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMToxN+KAr1BNIEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+
IHdyb3RlOgo+Cj4gQ3VycmVudGx5IGxvY2tfdHdvX25vbmRpcmVjdG9yaWVzKCkgaXMgc2tpcHBp
bmcgYW55IHBhc3NlZCBkaXJlY3Rvcmllcy4KPiBBZnRlciB2ZnNfcmVuYW1lKCkgdXNlcyBsb2Nr
X3R3b19pbm9kZXMoKSwgYWxsIHRoZSByZW1haW5pbmcgZm91ciB1c2Vycwo+IG9mIHRoaXMgZnVu
Y3Rpb24gcGFzcyBvbmx5IHJlZ3VsYXIgZmlsZXMgdG8gaXQuIFNvIGRyb3AgdGhlIHNvbWV3aGF0
Cj4gdW51c3VhbCAic2tpcCBkaXJlY3RvcnkiIGxvZ2ljIGFuZCBpbnN0ZWFkIHdhcm4gaWYgYW55
Ym9keSBwYXNzZXMKPiBkaXJlY3RvcnkgdG8gaXQuIFRoaXMgYWxzbyBhbGxvd3MgdXMgdG8gdXNl
IGxvY2tfdHdvX2lub2RlcygpIGluCj4gbG9ja190d29fbm9uZGlyZWN0b3JpZXMoKSB0byBjb25j
ZW50cmF0ZSB0aGUgbG9jayBvcmRlcmluZyBsb2dpYyBpbiBsZXNzCj4gcGxhY2VzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiAtLS0KPiAgZnMvaW5vZGUuYyB8
IDEyICsrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2lub2RlLmMgYi9mcy9pbm9kZS5jCj4gaW5k
ZXggMjAxNWZhNTBkMzRhLi5hY2NmNTEyNWEwNDkgMTAwNjQ0Cj4gLS0tIGEvZnMvaW5vZGUuYwo+
ICsrKyBiL2ZzL2lub2RlLmMKPiBAQCAtMTE0MCw3ICsxMTQwLDcgQEAgdm9pZCBsb2NrX3R3b19p
bm9kZXMoc3RydWN0IGlub2RlICppbm9kZTEsIHN0cnVjdCBpbm9kZSAqaW5vZGUyLAo+ICAvKioK
PiAgICogbG9ja190d29fbm9uZGlyZWN0b3JpZXMgLSB0YWtlIHR3byBpX211dGV4ZXMgb24gbm9u
LWRpcmVjdG9yeSBvYmplY3RzCj4gICAqCj4gLSAqIExvY2sgYW55IG5vbi1OVUxMIGFyZ3VtZW50
IHRoYXQgaXMgbm90IGEgZGlyZWN0b3J5Lgo+ICsgKiBMb2NrIGFueSBub24tTlVMTCBhcmd1bWVu
dC4gUGFzc2VkIG9iamVjdHMgbXVzdCBub3QgYmUgZGlyZWN0b3JpZXMuCj4gICAqIFplcm8sIG9u
ZSBvciB0d28gb2JqZWN0cyBtYXkgYmUgbG9ja2VkIGJ5IHRoaXMgZnVuY3Rpb24uCj4gICAqCj4g
ICAqIEBpbm9kZTE6IGZpcnN0IGlub2RlIHRvIGxvY2sKPiBAQCAtMTE0OCwxMyArMTE0OCw5IEBA
IHZvaWQgbG9ja190d29faW5vZGVzKHN0cnVjdCBpbm9kZSAqaW5vZGUxLCBzdHJ1Y3QgaW5vZGUg
Kmlub2RlMiwKPiAgICovCj4gIHZvaWQgbG9ja190d29fbm9uZGlyZWN0b3JpZXMoc3RydWN0IGlu
b2RlICppbm9kZTEsIHN0cnVjdCBpbm9kZSAqaW5vZGUyKQo+ICB7Cj4gLSAgICAgICBpZiAoaW5v
ZGUxID4gaW5vZGUyKQo+IC0gICAgICAgICAgICAgICBzd2FwKGlub2RlMSwgaW5vZGUyKTsKPiAt
Cj4gLSAgICAgICBpZiAoaW5vZGUxICYmICFTX0lTRElSKGlub2RlMS0+aV9tb2RlKSkKPiAtICAg
ICAgICAgICAgICAgaW5vZGVfbG9jayhpbm9kZTEpOwo+IC0gICAgICAgaWYgKGlub2RlMiAmJiAh
U19JU0RJUihpbm9kZTItPmlfbW9kZSkgJiYgaW5vZGUyICE9IGlub2RlMSkKPiAtICAgICAgICAg
ICAgICAgaW5vZGVfbG9ja19uZXN0ZWQoaW5vZGUyLCBJX01VVEVYX05PTkRJUjIpOwo+ICsgICAg
ICAgV0FSTl9PTl9PTkNFKFNfSVNESVIoaW5vZGUxLT5pX21vZGUpKTsKPiArICAgICAgIFdBUk5f
T05fT05DRShTX0lTRElSKGlub2RlMi0+aV9tb2RlKSk7Cj4gKyAgICAgICBsb2NrX3R3b19pbm9k
ZXMoaW5vZGUxLCBpbm9kZTIsIElfTVVURVhfTk9STUFMLCBJX01VVEVYX05PTkRJUjIpOwo+ICB9
Cj4gIEVYUE9SVF9TWU1CT0wobG9ja190d29fbm9uZGlyZWN0b3JpZXMpOwo+CgpOZWVkIHRoZSBz
YW1lIHRyZWF0bWVudCB0byB1bmxvY2tfdHdvX25vbmRpcmVjdG9yaWVzKCkgYmVjYXVzZSBub3cg
aWYKc29tZW9uZSBkb2VzIHBhc3MgYSBkaXJlY3RvcnkgdGhleSB3aWxsIGdldCBhIHdhcm5pbmcg
YnV0IGFsc28gYSBsZWFrZWQgbG9jay4KClRoYW5rcywKQW1pci4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
