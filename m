Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082A762B38
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 08:16:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOXos-0000f6-I6;
	Wed, 26 Jul 2023 06:16:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaoliu719@gmail.com>) id 1qOXor-0000ew-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 06:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ernir9u51/wgEye25LX0mupcEC1sFM0DouRjZV8wYio=; b=PyMguyCyeBvGlkseVPFR03RyFK
 RjFjv5XV9R6i9D3H4GgK/7bJXwHmbfOmBCZghbfutUtTZqyOH3jw2zQVR9kF/0TVZWkQolWp8MJtK
 Jnq31ObEU2BOF8N5wOcyCxxa2GQPjFMESZPEQMsqLEl1yMOyRtAWrNCsBNIcIydtulZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ernir9u51/wgEye25LX0mupcEC1sFM0DouRjZV8wYio=; b=GsmMo0/ZF44NHA/NWevGSKH1WJ
 0Rp9irEHSIp+//1iO+nr/pxyg+Rcvvru98YmHmFVD3br0aypsdQQjopxgz2n9ckquVmvS/smk9bxq
 FlwhKsJmceUgJKBi9f2H1Ut5YojDl7NHAvija3z+lsREToJdWF/qoJgJA4XJV3Q92Iz4=;
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOXom-002h09-A0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 06:16:20 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6bb07d274feso4938758a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jul 2023 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690352170; x=1690956970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ernir9u51/wgEye25LX0mupcEC1sFM0DouRjZV8wYio=;
 b=mt0UlGQ+pmHA4qsqZUGV/XJMAnbmqyj7W4s+pzNrncfLZ7ChSjR4TPLMFahkrUdNPS
 pREQHpbS1fqUtiUTovbKERHPbh6y1752E1KyEmRuwfFu0Y4v8Js2vepTAsx7AgB52Uxp
 x4ZPwdtT90KwoXfBSGPnH3vbd4a63QxanuH1cQDJKgp3LkADl02PlaTux9pD8umzu92d
 plCQiKPT41d4QhEIy1VpswauWNAvF6i+gk8TJ20lMzIUCOUP6LR3Itn+4pdr1L+YWIkO
 NbRdjovP5A3CT48I1aiDQw/Ffg997BQuRckM85Io9cw0VOixd1cGAI2bEq1+Ci2nHeXL
 1/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690352170; x=1690956970;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ernir9u51/wgEye25LX0mupcEC1sFM0DouRjZV8wYio=;
 b=l9ElSLXd7/wsq2+9QLomNKkjlJ9gciRSJzk5GRMHsgRkNFwWT8ZZ4veaWzGWsiQnje
 Jed+6bBH45/vYJKAV0rnsyJ5tPlVD+1NVn00PorF0cHupyHtlbDt6Gwt4eorlnfiHjSm
 A/fspNl/bpnJRqxrSu8+p9ySJpQe/Dmu+GimMKC/vmT1F14adt60wbUvQ56k1LQoQjcZ
 wDXvAYrZI5C2ZXphNUv9MC/U73tZgaoTE4X+Znr/M2pUFDFlsNWrjlcJn3p7Bx+WjvFk
 GIQdPAZEx4a5btQUMYgFRn41txNSKsYKhx7LGm5PvH5zZOWpSCHKwV66Tv88tCw+d181
 4yRQ==
X-Gm-Message-State: ABy/qLbKlQAxOIg5cyFgdqlthJXD9qFACUrMrvlJ63d/Eiv59FKaTRwu
 3gO00icafTTKbLJ50BS29FU=
X-Google-Smtp-Source: APBJJlHbQ9CllM7PkHL9SiMMNcT+1jT3DpoYfjjxzgjrSEyUIazflX54y7Z8vXRECvLCSSElJcO8RQ==
X-Received: by 2002:a05:6871:593:b0:1ba:2a58:b15e with SMTP id
 u19-20020a056871059300b001ba2a58b15emr1490083oan.2.1690352170466; 
 Tue, 25 Jul 2023 23:16:10 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 bn9-20020a056a00324900b00678afd48250sm10551739pfb.218.2023.07.25.23.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 23:16:09 -0700 (PDT)
Date: Wed, 26 Jul 2023 14:16:05 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZMC6JfDFOo3WrRsC@liuchao-VM>
References: <20230725013607.4134123-1-chaoliu719@gmail.com>
 <16625fbb-3dc0-34d5-ee75-fe010aa0d9ec@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16625fbb-3dc0-34d5-ee75-fe010aa0d9ec@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 7ÔÂ 26 09:24, Chao Yu wrote: > On 2023/7/25 9:36, Chao
   Liu wrote: > > From: Chao Liu > > > > This patch is a cleanup: > > 1. Merge
    __drop_largest_extent() since it has only one caller. > > 2. Int [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [chaoliu719[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qOXom-002h09-A0
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce two helper functions for
 the largest cached extent
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gN9TCIDI2IDA5OjI0LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvNy8yNSA5OjM2LCBDaGFv
IExpdSB3cm90ZToKPiA+IEZyb206IENoYW8gTGl1IDxsaXVjaGFvQGNvb2xwYWQuY29tPgo+ID4K
PiA+IFRoaXMgcGF0Y2ggaXMgYSBjbGVhbnVwOgo+ID4gMS4gTWVyZ2UgX19kcm9wX2xhcmdlc3Rf
ZXh0ZW50KCkgc2luY2UgaXQgaGFzIG9ubHkgb25lIGNhbGxlci4KPiA+IDIuIEludHJvZHVjZSBf
X3VubG9ja190cmVlX3dpdGhfY2hlY2tpbmdfbGFyZ2VzdCgpIGFuZAo+ID4gICAgIF9fZHJvcF9s
YXJnZXN0X2V4dGVudCgpIHRvIGhlbHAgbWFuYWdlIGxhcmdlc3QgYW5kIGxhcmdlc3RfdXBkYXRl
Cj4gPiAgICAgaW4gZXh0ZW50X3RyZWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBMaXUg
PGxpdWNoYW9AY29vbHBhZC5jb20+Cj4gPiAtLS0KPiA+IHYyOiBNYWtlIHN1cmUgZXQtPmxhcmdl
c3RfdXBkYXRlZCBnZXRzIHVwZGF0ZWQgd2l0aGluICZldC0+bG9jay4KPiA+ICAgICAgVGhhbmtz
IHRvIENoYW8gWXUgZm9yIHBvaW50aW5nIG91dC4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2V4dGVu
dF9jYWNoZS5jIHwgNjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgICAgICAgfCAgNCArLS0KPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9leHRlbnRfY2FjaGUuYyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPiA+IGlu
ZGV4IDBlMmQ0OTE0MGMwN2YuLmNmYzY5NjIxYThhMjYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZz
L2V4dGVudF9jYWNoZS5jCj4gPiArKysgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4gPiBAQCAt
MTksNiArMTksMTIgQEAKPiA+ICAgI2luY2x1ZGUgIm5vZGUuaCIKPiA+ICAgI2luY2x1ZGUgPHRy
YWNlL2V2ZW50cy9mMmZzLmg+Cj4gPiArc3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50
KHN0cnVjdCBleHRlbnRfdHJlZSAqZXQpCj4gPiArewo+ID4gKwlldC0+bGFyZ2VzdC5sZW4gPSAw
Owo+ID4gKwlldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsKPiA+ICt9Cj4gPiArCj4gPiAgIGJv
b2wgc2FuaXR5X2NoZWNrX2V4dGVudF9jYWNoZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gICB7
Cj4gPiAgIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+ID4g
QEAgLTM1LDggKzQxLDcgQEAgYm9vbCBzYW5pdHlfY2hlY2tfZXh0ZW50X2NhY2hlKHN0cnVjdCBp
bm9kZSAqaW5vZGUpCj4gPiAgIAkvKiBMZXQncyBkcm9wLCBpZiBjaGVja3BvaW50IGdvdCBjb3Jy
dXB0ZWQuICovCj4gPiAgIAlpZiAoaXNfc2V0X2NrcHRfZmxhZ3Moc2JpLCBDUF9FUlJPUl9GTEFH
KSkgewo+ID4gLQkJZWktPmxlbiA9IDA7Cj4gPiAtCQlldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1
ZTsKPiA+ICsJCV9fZHJvcF9sYXJnZXN0X2V4dGVudChldCk7Cj4KPiBfX2Ryb3BfbGFyZ2VzdF9l
eHRlbnRfZm9yY2UoZXQpOwo+Cj4gPiAgIAkJcmV0dXJuIHRydWU7Cj4gPiAgIAl9Cj4gPiBAQCAt
MzEwLDYgKzMxNSw4IEBAIHN0YXRpYyB2b2lkIF9fZGV0YWNoX2V4dGVudF9ub2RlKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgCWlmIChldC0+Y2FjaGVkX2VuID09IGVuKQo+ID4gICAJ
CWV0LT5jYWNoZWRfZW4gPSBOVUxMOwo+ID4gKwo+ID4gKwkvKiBrZWVwIHRoZSBsYXJnZXN0IGFz
IHdlIGNhbiBzdGlsbCB1c2UgaXQgKi8KPgo+IFRoZSBjb21tZW50cyBkb2Vzbid0IG1hdGNoIGJl
bG93IGNvZGU/Cj4KClNvcnJ5IGZvciBub3QgZXhwbGFpbmluZyB0aGlzIGVhcmxpZXIuCgpJdCdz
IGp1c3QgYSBoaW50IGFuZCBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjb2RlIGJlbG93LiBJ
dApzaW1wbHkgZXhwbGFpbnMgdGhhdCB3ZSBkb24ndCBuZWVkIHRvIGRpc2FibGUgdGhlIGxhcmdl
c3QgaGVyZSwgd2hpY2gKbWFrZXMgdGhlIHdob2xlIGNvZGUgbG9naWMgb2YgdGhlIGxhcmdlc3Qg
bW9yZSBjbGVhci4gOikKCklmIGl0J3Mgbm90IGZpdHRpbmcsIHBsZWFzZSBsZXQgbWUga25vdywg
YW5kIEknbGwgZHJvcCB0aGVtLgoKPiA+ICAgCWttZW1fY2FjaGVfZnJlZShleHRlbnRfbm9kZV9z
bGFiLCBlbik7Cj4gPiAgIH0KPiA+IEBAIC0zODUsMTUgKzM5Miw2IEBAIHN0YXRpYyB1bnNpZ25l
ZCBpbnQgX19mcmVlX2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAg
CXJldHVybiBjb3VudCAtIGF0b21pY19yZWFkKCZldC0+bm9kZV9jbnQpOwo+ID4gICB9Cj4gPiAt
c3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdCBleHRlbnRfdHJlZSAqZXQs
Cj4gPiAtCQkJCQlwZ29mZl90IGZvZnMsIHVuc2lnbmVkIGludCBsZW4pCj4gPiAtewo+ID4gLQlp
ZiAoZm9mcyA8IGV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5sZW4gJiYKPiA+IC0JCQlm
b2ZzICsgbGVuID4gZXQtPmxhcmdlc3QuZm9mcykgewo+ID4gLQkJZXQtPmxhcmdlc3QubGVuID0g
MDsKPiA+IC0JCWV0LT5sYXJnZXN0X3VwZGF0ZWQgPSB0cnVlOwo+ID4gLQl9Cj4gPiAtfQo+Cj4g
V2hhdCBhYm91dDoKPgo+IHN0YXRpYyB2b2lkIF9fZHJvcF9sYXJnZXN0X2V4dGVudF9jb25kKHN0
cnVjdCBleHRlbnRfdHJlZSAqZXQsCj4gCQkJCQlwZ29mZl90IGZvZnMsIHVuc2lnbmVkIGludCBs
ZW4sCj4gCQkJCQlib29sIGZvcmNlKQo+IHsKPiAJaWYgKGZvcmNlIHx8IChmb2ZzIDwgZXQtPmxh
cmdlc3QuZm9mcyArIGV0LT5sYXJnZXN0LmxlbiAmJgo+IAkJCWZvZnMgKyBsZW4gPiBldC0+bGFy
Z2VzdC5mb2ZzKSkgewo+IAkJZXQtPmxhcmdlc3QubGVuID0gMDsKPiAJCWV0LT5sYXJnZXN0X3Vw
ZGF0ZWQgPSB0cnVlOwo+IAl9Cj4gfQo+Cj4gc3RhdGljIHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0
ZW50X2ZvcmNlKHN0cnVjdCBleHRlbnRfdHJlZSAqZXQpCj4gewo+IAlfX2Ryb3BfbGFyZ2VzdF9l
eHRlbnRfY29uZChldCwgMCwgMCwgdHJ1ZSk7Cj4gfQo+CgpUaGFuayB5b3UuIEkgZmVlbCBpdCBt
YXRjaGVzIGJldHRlciB3aXRoIHRoZSBleGlzdGluZyBjb2RlCm9yZ2FuaXphdGlvbiBzdHlsZS4g
TGV0IG1lIGFwcGx5IGl0IGluIHYzLgoKPiA+ICAgdm9pZCBmMmZzX2luaXRfcmVhZF9leHRlbnRf
dHJlZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgcGFnZSAqaXBhZ2UpCj4gPiAgIHsKPiA+
IEBAIC02MDEsNiArNTk5LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgZXh0ZW50X25vZGUgKl9faW5zZXJ0
X2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgCXJldHVybiBlbjsK
PiA+ICAgfQo+ID4gK3N0YXRpYyB2b2lkIF9fdW5sb2NrX3RyZWVfd2l0aF9jaGVja2luZ19sYXJn
ZXN0KHN0cnVjdCBleHRlbnRfdHJlZSAqZXQsCj4gPiArCQkJCQkJc3RydWN0IGlub2RlICppbm9k
ZSkKPiA+ICt7Cj4gPiArCWlmIChldC0+dHlwZSA9PSBFWF9SRUFEICYmIGV0LT5sYXJnZXN0X3Vw
ZGF0ZWQpIHsKPiA+ICsJCWV0LT5sYXJnZXN0X3VwZGF0ZWQgPSBmYWxzZTsKPiA+ICsJCXdyaXRl
X3VubG9jaygmZXQtPmxvY2spOwo+ID4gKwkJZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5v
ZGUsIHRydWUpOwo+ID4gKwkJcmV0dXJuOwo+ID4gKwl9Cj4gPiArCj4gPiArCXdyaXRlX3VubG9j
aygmZXQtPmxvY2spOwo+ID4gK30KPiA+ICsKPiA+ICAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0
ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ICAgCQkJc3RydWN0IGV4dGVu
dF9pbmZvICp0ZWksIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkKPiA+ICAgewo+ID4gQEAgLTYxMiw3
ICs2MjMsNiBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLAo+ID4gICAJc3RydWN0IHJiX25vZGUgKippbnNlcnRfcCA9IE5VTEwsICpp
bnNlcnRfcGFyZW50ID0gTlVMTDsKPiA+ICAgCXVuc2lnbmVkIGludCBmb2ZzID0gdGVpLT5mb2Zz
LCBsZW4gPSB0ZWktPmxlbjsKPiA+ICAgCXVuc2lnbmVkIGludCBlbmQgPSBmb2ZzICsgbGVuOwo+
ID4gLQlib29sIHVwZGF0ZWQgPSBmYWxzZTsKPiA+ICAgCWJvb2wgbGVmdG1vc3QgPSBmYWxzZTsK
PiA+ICAgCWlmICghZXQpCj4gPiBAQCAtNjM2LDExICs2NDYsMTAgQEAgc3RhdGljIHZvaWQgX191
cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwKPiA+ICAgCQlwcmV2
ID0gZXQtPmxhcmdlc3Q7Cj4gPiAgIAkJZGVpLmxlbiA9IDA7Cj4gPiAtCQkvKgo+ID4gLQkJICog
ZHJvcCBsYXJnZXN0IGV4dGVudCBiZWZvcmUgbG9va3VwLCBpbiBjYXNlIGl0J3MgYWxyZWFkeQo+
ID4gLQkJICogYmVlbiBzaHJ1bmsgZnJvbSBleHRlbnQgdHJlZQo+ID4gLQkJICovCj4gPiAtCQlf
X2Ryb3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZvZnMsIGxlbik7Cj4KPiBfX2Ryb3BfbGFyZ2VzdF9l
eHRlbnRfY29uZChldCwgZm9mcywgbGVuLCBmYWxzZSk7Cj4KPiA+ICsJCS8qIHVwZGF0ZXMgbWF5
IGNhdXNlIGxhcmdlc3QgZXh0ZW50IGNhY2hlIHRvIGJlY29tZSBpbnZhbGlkICovCj4gPiArCQlp
ZiAoZm9mcyA8IGV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5sZW4gJiYKPiA+ICsJCSAg
ICBmb2ZzICsgbGVuID4gZXQtPmxhcmdlc3QuZm9mcykKPiA+ICsJCQlfX2Ryb3BfbGFyZ2VzdF9l
eHRlbnQoZXQpOwo+ID4gICAJfQo+ID4gICAJLyogMS4gbG9va3VwIGZpcnN0IGV4dGVudCBub2Rl
IGluIHJhbmdlIFtmb2ZzLCBmb2ZzICsgbGVuIC0gMV0gKi8KPiA+IEBAIC03MzMsOCArNzQyLDcg
QEAgc3RhdGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IGlub2RlICpp
bm9kZSwKPiA+ICAgCQlpZiAoZGVpLmxlbiA+PSAxICYmCj4gPiAgIAkJCQlwcmV2LmxlbiA8IEYy
RlNfTUlOX0VYVEVOVF9MRU4gJiYKPiA+ICAgCQkJCWV0LT5sYXJnZXN0LmxlbiA8IEYyRlNfTUlO
X0VYVEVOVF9MRU4pIHsKPiA+IC0JCQlldC0+bGFyZ2VzdC5sZW4gPSAwOwo+ID4gLQkJCWV0LT5s
YXJnZXN0X3VwZGF0ZWQgPSB0cnVlOwo+ID4gKwkJCV9fZHJvcF9sYXJnZXN0X2V4dGVudChldCk7
Cj4KPiBfX2Ryb3BfbGFyZ2VzdF9leHRlbnRfZm9yY2UoZXQpOwo+Cj4gPiAgIAkJCXNldF9pbm9k
ZV9mbGFnKGlub2RlLCBGSV9OT19FWFRFTlQpOwo+ID4gICAJCX0KPiA+ICAgCX0KPiA+IEBAIC03
NDIsMTAgKzc1MCw2IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0
cnVjdCBpbm9kZSAqaW5vZGUsCj4gPiAgIAlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJ
X05PX0VYVEVOVCkpCj4gPiAgIAkJX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4gLQlp
ZiAoZXQtPmxhcmdlc3RfdXBkYXRlZCkgewo+ID4gLQkJZXQtPmxhcmdlc3RfdXBkYXRlZCA9IGZh
bHNlOwo+ID4gLQkJdXBkYXRlZCA9IHRydWU7Cj4gPiAtCX0KPgo+IEkgZ3Vlc3Mgd2UnZCBiZXR0
ZXIga2VlcCBwcmV2aW91cyBsb2dpYy4KCk9rLCBJIHdpbGwgZHJvcCB0aGVzZSBjaGFuZ2VzIGlu
IHYzLiBEaXR0byBmb3IgX19kcm9wX2V4dGVudF90cmVlKCkuCgo+Cj4gPiAgIAlnb3RvIG91dF9y
ZWFkX2V4dGVudF9jYWNoZTsKPiA+ICAgdXBkYXRlX2FnZV9leHRlbnRfY2FjaGU6Cj4gPiAgIAlp
ZiAoIXRlaS0+bGFzdF9ibG9ja3MpCj4gPiBAQCAtNzU3LDEwICs3NjEsNyBAQCBzdGF0aWMgdm9p
ZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4gICAJ
CV9faW5zZXJ0X2V4dGVudF90cmVlKHNiaSwgZXQsICZlaSwKPiA+ICAgCQkJCQlpbnNlcnRfcCwg
aW5zZXJ0X3BhcmVudCwgbGVmdG1vc3QpOwo+ID4gICBvdXRfcmVhZF9leHRlbnRfY2FjaGU6Cj4g
PiAtCXdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+ID4gLQo+ID4gLQlpZiAodXBkYXRlZCkKPiA+
IC0JCWYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPgo+IERpdHRvLAo+
Cj4gPiArCV9fdW5sb2NrX3RyZWVfd2l0aF9jaGVja2luZ19sYXJnZXN0KGV0LCBpbm9kZSk7Cj4g
PiAgIH0KPiA+ICAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4gPiBAQCAtMTA5
Miw3ICsxMDkzLDYgQEAgc3RhdGljIHZvaWQgX19kcm9wX2V4dGVudF90cmVlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIGVudW0gZXh0ZW50X3R5cGUgdHlwZSkKPiA+ICAgewo+ID4gICAJc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiA+ICAgCXN0cnVjdCBleHRlbnRf
dHJlZSAqZXQgPSBGMkZTX0koaW5vZGUpLT5leHRlbnRfdHJlZVt0eXBlXTsKPiA+IC0JYm9vbCB1
cGRhdGVkID0gZmFsc2U7Cj4gPiAgIAlpZiAoIV9fbWF5X2V4dGVudF90cmVlKGlub2RlLCB0eXBl
KSkKPiA+ICAgCQlyZXR1cm47Cj4gPiBAQCAtMTEwMSwxNCArMTEwMSwxMCBAQCBzdGF0aWMgdm9p
ZCBfX2Ryb3BfZXh0ZW50X3RyZWUoc3RydWN0IGlub2RlICppbm9kZSwgZW51bSBleHRlbnRfdHlw
ZSB0eXBlKQo+ID4gICAJX19mcmVlX2V4dGVudF90cmVlKHNiaSwgZXQpOwo+ID4gICAJaWYgKHR5
cGUgPT0gRVhfUkVBRCkgewo+ID4gICAJCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19FWFRF
TlQpOwo+ID4gLQkJaWYgKGV0LT5sYXJnZXN0Lmxlbikgewo+ID4gLQkJCWV0LT5sYXJnZXN0Lmxl
biA9IDA7Cj4gPiAtCQkJdXBkYXRlZCA9IHRydWU7Cj4gPiAtCQl9Cj4gPiArCQlpZiAoZXQtPmxh
cmdlc3QubGVuKQo+ID4gKwkJCV9fZHJvcF9sYXJnZXN0X2V4dGVudChldCk7Cj4gPiAgIAl9Cj4g
PiAtCXdyaXRlX3VubG9jaygmZXQtPmxvY2spOwo+ID4gLQlpZiAodXBkYXRlZCkKPiA+IC0JCWYy
ZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPgo+IERpdHRvLAo+Cj4gVGhh
bmtzLAo+Cj4gPiArCV9fdW5sb2NrX3RyZWVfd2l0aF9jaGVja2luZ19sYXJnZXN0KGV0LCBpbm9k
ZSk7Cj4gPiAgIH0KPiA+ICAgdm9pZCBmMmZzX2Ryb3BfZXh0ZW50X3RyZWUoc3RydWN0IGlub2Rl
ICppbm9kZSkKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5o
Cj4gPiBpbmRleCBkMzcyYmVkYjBmZTRlLi5kYTAyZTEyMGU1ZWE2IDEwMDY0NAo+ID4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtNjY1LDcgKzY2
NSw3IEBAIHN0cnVjdCBleHRlbnRfdHJlZSB7Cj4gPiAgIHN0cnVjdCBleHRlbnRfdHJlZV9pbmZv
IHsKPiA+ICAgCXN0cnVjdCByYWRpeF90cmVlX3Jvb3QgZXh0ZW50X3RyZWVfcm9vdDsvKiBjYWNo
ZSBleHRlbnQgY2FjaGUgZW50cmllcyAqLwo+ID4gLQlzdHJ1Y3QgbXV0ZXggZXh0ZW50X3RyZWVf
bG9jazsJLyogbG9ja2luZyBleHRlbnQgcmFkaXggdHJlZSAqLwo+ID4gKwlzdHJ1Y3QgbXV0ZXgg
ZXh0ZW50X3RyZWVfbG9jazsJCS8qIGxvY2tpbmcgZXh0ZW50IHJhZGl4IHRyZWUgKi8KPiA+ICAg
CXN0cnVjdCBsaXN0X2hlYWQgZXh0ZW50X2xpc3Q7CQkvKiBscnUgbGlzdCBmb3Igc2hyaW5rZXIg
Ki8KPiA+ICAgCXNwaW5sb2NrX3QgZXh0ZW50X2xvY2s7CQkJLyogbG9ja2luZyBleHRlbnQgbHJ1
IGxpc3QgKi8KPiA+ICAgCWF0b21pY190IHRvdGFsX2V4dF90cmVlOwkJLyogZXh0ZW50IHRyZWUg
Y291bnQgKi8KPiA+IEBAIC03NjYsNyArNzY2LDcgQEAgZW51bSB7Cj4gPiAgIAlGSV9BQ0xfTU9E
RSwJCS8qIGluZGljYXRlIGFjbCBtb2RlICovCj4gPiAgIAlGSV9OT19BTExPQywJCS8qIHNob3Vs
ZCBub3QgYWxsb2NhdGUgYW55IGJsb2NrcyAqLwo+ID4gICAJRklfRlJFRV9OSUQsCQkvKiBmcmVl
IGFsbG9jYXRlZCBuaWRlICovCj4gPiAtCUZJX05PX0VYVEVOVCwJCS8qIG5vdCB0byB1c2UgdGhl
IGV4dGVudCBjYWNoZSAqLwo+ID4gKwlGSV9OT19FWFRFTlQsCQkvKiBub3QgdG8gdXNlIHRoZSBy
ZWFkIGV4dGVudCBjYWNoZSAqLwo+ID4gICAJRklfSU5MSU5FX1hBVFRSLAkvKiB1c2VkIGZvciBp
bmxpbmUgeGF0dHIgKi8KPiA+ICAgCUZJX0lOTElORV9EQVRBLAkJLyogdXNlZCBmb3IgaW5saW5l
IGRhdGEqLwo+ID4gICAJRklfSU5MSU5FX0RFTlRSWSwJLyogdXNlZCBmb3IgaW5saW5lIGRlbnRy
eSAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
