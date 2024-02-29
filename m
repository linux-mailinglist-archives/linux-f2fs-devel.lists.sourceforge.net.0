Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 760E986D0F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:42:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfkPv-0002Ar-Ow;
	Thu, 29 Feb 2024 17:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rfkPu-0002Al-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S2olijefr8r2GLBicKoERyrJ4GIhxgDek+nU7uJKZm0=; b=H8i34SQv4fao3AGrv0yRtNK35W
 7rzZfn8eM9iGmUJtQ6N+ea2kRx6qbAKlwopsOULh8GJTZe348IbMjFZpK6zXbFPLSo6BfeQkB54bU
 Dn+HVVVpT6zS295LNqq9/sgnnvARby/X86eW8oayyfsduC1MGhGpAcbuLXNwhLNNPAt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S2olijefr8r2GLBicKoERyrJ4GIhxgDek+nU7uJKZm0=; b=mQie2hdnYqbsad4Qj4X8MMZhnx
 rCfB1qXj6jZe0hnruDKeJKy1tKxpdfWrmu+Gr+fHpi4UweA+ZCLs1ZQ59lHcvdLwA/jxHVhJYU0HJ
 eVekJtDtWSBRGRnXtz1902vcegBa1CZUKpRz/8KATylBTu6/74i06I+Cf/g3mGql7/Is=;
Received: from mail-vk1-f174.google.com ([209.85.221.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfkPq-0001oL-Vj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:41:59 +0000
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4d332d0db9cso302816e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 09:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709228504; x=1709833304; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2olijefr8r2GLBicKoERyrJ4GIhxgDek+nU7uJKZm0=;
 b=EpONJITXwl28lHJhrLnSSN9Or8H8lSOVK+ccGKDxHWrxTrlqHPdKsNeBJjfrWOQiI/
 fG2iDxbZKUcU0ELfP67oi4UoUvdrNOLDFF49vnxNaG5e5UeyE17hkonAjiWlUzH2GD10
 HdrmvXkElLhU+gTueVHuzOr/UCQwlQ2UX3VapMPGh2AeCtA7Z0MJW+gVUfBj+qF8Jnf2
 WAuIkpW9Y4jwIK29puLn6e3T+i6vxVF3BXLCU0HuhEBc7sgpW/j+OobDnrAw9sdhptKk
 DyzDbBqWu41lkWal4KeYQkpob68P6YxeXXPUpdMrFTFH9VL7HyWQdSXKklzeVrUSUUF/
 XSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709228504; x=1709833304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2olijefr8r2GLBicKoERyrJ4GIhxgDek+nU7uJKZm0=;
 b=n3eQ1NIE+uJr0FhwIHUy1Rhfs2EpgRC73X9jAAUtEheqBBaaEkEgXXxL+7TILyLQlU
 dpFTJE6z/RBvuklQ38cW0GbnU9c24DTNndpRAeZis5Fn3Ny07WW+bB2qJW59OOqXj8gG
 fSQcVMkT/+3nVEkqAhDY71WFSEnq++6R+o2WdFigMN1WfCVg8CawCu9elQReQJoHHD2P
 89olr7cu5tb6BtoCLGB4Mnc81wTtAE3zjQjIhrNjiNwOcWxU9H5WN2HFbOOjIzpMQbUN
 OE8OdAgEvAUBWUs76pFKdrUJHToHgXw47TADK0z8kIg19wMzHUk8NEePK9kT5W53yj2r
 BQtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA4McQofMoftFxKU/XsC9TnRmMuoscEkHrQekv2PjKZEA/mRv0nQZGmJb6ghWisziK4gyGWQ7k45GIU1xEBli/RNxv3Kc9lFcUB1BN1/rRYl/wUpoP3g==
X-Gm-Message-State: AOJu0YxbRcHGeDILF/lOIPsF2a0nXqxXhbmSIsCWR2qH3QXj8d0Kih7W
 A6pYDlykQRjA5C+WeUyDf5EHH/uUReICuZc5wiNEdTAweeNfESeDIEis1unn6BBieQpa2AK2p59
 1NQFj8lHJnAaDw3V7cb/rzV6zioI=
X-Google-Smtp-Source: AGHT+IFwrxCvB48fqi/4yOhBcW29D5X9hpeOX+z7SzntXypJfSFeSHLD3FRq+DIAQVjUd0rx+LKUd0d/lHXlwxFquLk=
X-Received: by 2002:a1f:e483:0:b0:4cb:56c5:5818 with SMTP id
 b125-20020a1fe483000000b004cb56c55818mr2651057vkh.3.1709228504059; Thu, 29
 Feb 2024 09:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20240226013208.2389246-1-chao@kernel.org>
 <2b81aa6f-db51-4a7c-97ab-2af2c2fea056@kernel.org>
In-Reply-To: <2b81aa6f-db51-4a7c-97ab-2af2c2fea056@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 29 Feb 2024 09:41:33 -0800
Message-ID: <CACOAw_yn4m+nEGMEX8RL1xFEaZpzXvjUhUdSoo9d2EeGfzPrAA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Feb 29, 2024 at 2:11 AM Chao Yu wrote: > > Jaegeuk,
    Daeho, > > Any comments on this serials? > > Thanks, No functional difference
    here, since start_blk is always aligned with the section address. However,
    this is more clear in itself. 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.174 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfkPq-0001oL-Vj
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
 f2fs_migrate_blocks()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBGZWIgMjksIDIwMjQgYXQgMjoxMeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBKYWVnZXVrLCBEYWVobywKPgo+IEFueSBjb21tZW50cyBvbiB0aGlzIHNl
cmlhbHM/Cj4KPiBUaGFua3MsCgpObyBmdW5jdGlvbmFsIGRpZmZlcmVuY2UgaGVyZSwgc2luY2Ug
c3RhcnRfYmxrIGlzIGFsd2F5cyBhbGlnbmVkIHdpdGgKdGhlIHNlY3Rpb24gYWRkcmVzcy4KSG93
ZXZlciwgdGhpcyBpcyBtb3JlIGNsZWFyIGluIGl0c2VsZi4KClJldmlld2VkLWJ5OiBEYWVobyBK
ZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKVGhhbmtzLAoKPgo+IE9uIDIwMjQvMi8yNiA5
OjMyLCBDaGFvIFl1IHdyb3RlOgo+ID4gSW4gZjJmc19taWdyYXRlX2Jsb2NrcygpLCB3aGVuIHRy
YXZlcnNpbmcgYmxvY2tzIGluIGxhc3Qgc2VjdGlvbiwKPiA+IGJsa29mc19lbmQgc2hvdWxkIGJl
IChzdGFydF9ibGsgKyBibGtjbnQgLSAxKSAlIGJsa19wZXJfc2VjLCBmaXggaXQuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGZz
L2YyZnMvZGF0YS5jIHwgNSArKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gPiBpbmRleCBjMjFiOTJmMTg0NjMuLjBjNzI4ZTgyZDkzNiAxMDA2
NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4g
QEAgLTM4NDEsMTMgKzM4NDEsMTQgQEAgc3RhdGljIGludCBmMmZzX21pZ3JhdGVfYmxvY2tzKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3Qgc3RhcnRfYmxrLAo+ID4gICAgICAgc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiA+ICAgICAgIHVuc2lnbmVkIGlu
dCBibGtvZnM7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgYmxrX3Blcl9zZWMgPSBCTEtTX1BFUl9T
RUMoc2JpKTsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBlbmRfYmxrID0gc3RhcnRfYmxrICsgYmxr
Y250IC0gMTsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBzZWNpZHggPSBzdGFydF9ibGsgLyBibGtf
cGVyX3NlYzsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBlbmRfc2VjOwo+ID4gICAgICAgaW50IHJl
dCA9IDA7Cj4gPgo+ID4gICAgICAgaWYgKCFibGtjbnQpCj4gPiAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ID4gLSAgICAgZW5kX3NlYyA9IHNlY2lkeCArIChibGtjbnQgLSAxKSAvIGJsa19wZXJf
c2VjOwo+ID4gKyAgICAgZW5kX3NlYyA9IGVuZF9ibGsgLyBibGtfcGVyX3NlYzsKPiA+Cj4gPiAg
ICAgICBmMmZzX2Rvd25fd3JpdGUoJkYyRlNfSShpbm9kZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsK
PiA+ICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ID4g
QEAgLTM4NTcsNyArMzg1OCw3IEBAIHN0YXRpYyBpbnQgZjJmc19taWdyYXRlX2Jsb2NrcyhzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBibG9ja190IHN0YXJ0X2JsaywKPiA+Cj4gPiAgICAgICBmb3IgKDsg
c2VjaWR4IDw9IGVuZF9zZWM7IHNlY2lkeCsrKSB7Cj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBibGtvZnNfZW5kID0gc2VjaWR4ID09IGVuZF9zZWMgPwo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgIChibGtjbnQgLSAxKSAlIGJsa19wZXJfc2VjIDogYmxrX3Blcl9zZWMgLSAxOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kX2JsayAlIGJsa19wZXJfc2VjIDogYmxr
X3Blcl9zZWMgLSAxOwo+ID4KPiA+ICAgICAgICAgICAgICAgZjJmc19kb3duX3dyaXRlKCZzYmkt
PnBpbl9zZW0pOwo+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
