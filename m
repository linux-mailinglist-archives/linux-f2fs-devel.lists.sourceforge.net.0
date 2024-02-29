Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8B86D0FA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:42:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfkQ2-00034V-Og;
	Thu, 29 Feb 2024 17:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rfkQ0-00034P-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQH2kEF1fd/n2WQZsc7xucdtJjSFJpVP+ITv1bMt0zY=; b=MgyhOJbb1I+8Yii7bwoUAAROEa
 zMnUAZSckB0a5uZXDFIUPXKuEkFT/2pz2ejL5ShxptzhutSyvd4pTKOjbV/VsceMQcxZbly74rkTV
 jkJj8TGDZnjUAQKGdqL63jSxYoJ3koUwECGpy2Ze8RoODVeZgcqS1PW3zEArpMh1v1Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IQH2kEF1fd/n2WQZsc7xucdtJjSFJpVP+ITv1bMt0zY=; b=Co3ZsLTJwFyzOubPpl7m/SRAl8
 i2kKYOQDhBlO1eHIoAJJA0Wx8BK49/ywQFJjpnVWfJ8/tvabzDqL3O2KipoV1NitSeM9tAmNTzf8s
 ta0Cgxurc3LxfInnSS9ILvgRmRq5cgGDC0AdBMgp1qEtb2CMjLptcynqs2Ni+yJqQ1MM=;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfkPz-0001oe-LS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:42:05 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6e2ee49ebaaso500336a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 09:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709228513; x=1709833313; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQH2kEF1fd/n2WQZsc7xucdtJjSFJpVP+ITv1bMt0zY=;
 b=DZjDGerthHiPRwVvIBUBaJafCazYZEdTtY2Z2bAEyt/eeqOP3c8wGi0atCfxkc8Apn
 JQcdGQau4EnRtQzJexgJgdsVAIna7AIU6L5YfcoKclAeGQafPEABOuVBTzRUPbN7nPSg
 k8WE+HYeFrAzwu10Zpe469w38lE9BMitL7/x8+AqtZ54mXEcsrCKS+S7YZVscVatLY+I
 Td0KDivMI6ItH9AzkCql629Ag4ymsnGzjWGpVF1tiJaIqIpvBxPuie++HDmjadcQNkI+
 Q6pvcaNURkG1HtfDFoyWdXiyWb31vZY3TH5+wu8xaptEY2BKvQcNxbqT67L2/6FTc4km
 JPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709228513; x=1709833313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQH2kEF1fd/n2WQZsc7xucdtJjSFJpVP+ITv1bMt0zY=;
 b=cCWgJUHbqO0YKcH3E3RPe4kCZjeY9Yuj7CwfvgwdchTFH4Ppx0nwCwAkLJqtW3Jphu
 2iSh8Tk17mOoEEEj3uLR3sMSuZz9aBYhrocIeCtWX6/5uncqq6MZcgfriD3uv0G+kcVC
 09ll4vwslEMVuiOTo0G6GaBO3ux6UzIYyOJ8h8TcS8NzecqOQWUsje9CtkF4Ro0tGBMx
 MaWX81q/wmuGKzfLO1hJA52GEGaFZU60aRtHbMFBYWh1MtImVxj3fffZTNf/EOtiUYZE
 et6HB0TXlo5oefhc6B2xQFms/lSZZcb6Zac0IM32kVX14BW9Fui3bUS/1Zj7idFiYdaW
 mpLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKokVbHa3ODNz7zWc9rtc7Q32fF4KVhMkFM5b5Y03QEtVZDr5E1b6UgV+xGAQKV0bjzeeVLM41TOPNCJ8neRT7h92GmOjqbxvC4q9kE6L9LSN2k//OZA==
X-Gm-Message-State: AOJu0YxdfFBho5iUQUseGYZqyPY4dAJ9al0SPRE0UOnRdgdzcJItIUzb
 pUAsfYBRaxoaFoQA3LnmveuLfTlYIl6aufhuczsPl3dGyieDx4BkDxKcqI2MgPJ/7NLmO100GnI
 ASW2aLO3RUjjXPQDtGqO5oCPHhG4=
X-Google-Smtp-Source: AGHT+IFqu3534frvCxwANMLH7IOv+D5fvIdsTNlvhalr8QBR3MD69zJBV+Fbonk83QZmTRsBpZiAfnt1zxREbQMfbk8=
X-Received: by 2002:a9d:7a48:0:b0:6e4:7271:2bdf with SMTP id
 z8-20020a9d7a48000000b006e472712bdfmr2557571otm.32.1709228512955; Thu, 29 Feb
 2024 09:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20240226013208.2389246-1-chao@kernel.org>
 <20240226013208.2389246-2-chao@kernel.org>
In-Reply-To: <20240226013208.2389246-2-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 29 Feb 2024 09:41:42 -0800
Message-ID: <CACOAw_wG_6OVMFC1OKEvc_Y0YanZTcVgum6VL=bh-nqJgg=uZg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Sun, Feb 25, 2024 at 5:33 PM
    Chao Yu wrote: > > This patch exchangs position of f2fs_precache_extents()
    and > filemap_fdatawrite(), so that f2fs_precache_extents() can load > extent
    info after [...] 
 
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
                             [209.85.210.48 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rfkPz-0001oe-LS
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: relocate f2fs_precache_extents()
 in f2fs_swap_activate()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA1OjMz4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggZXhjaGFuZ3MgcG9zaXRpb24gb2YgZjJmc19wcmVj
YWNoZV9leHRlbnRzKCkgYW5kCj4gZmlsZW1hcF9mZGF0YXdyaXRlKCksIHNvIHRoYXQgZjJmc19w
cmVjYWNoZV9leHRlbnRzKCkgY2FuIGxvYWQKPiBleHRlbnQgaW5mbyBhZnRlciBwaHlzaWNhbCBh
ZGRyZXNzZXMgb2YgYWxsIGRhdGEgYXJlIGZpeGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL2RhdGEuYyB8IDQgKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiBpbmRleCAwYzcyOGU4MmQ5
MzYuLmJkODY3NGJmMWQ4NCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2Zz
L2YyZnMvZGF0YS5jCj4gQEAgLTQwNDUsMTIgKzQwNDUsMTIgQEAgc3RhdGljIGludCBmMmZzX3N3
YXBfYWN0aXZhdGUoc3RydWN0IHN3YXBfaW5mb19zdHJ1Y3QgKnNpcywgc3RydWN0IGZpbGUgKmZp
bGUsCj4gICAgICAgICBpZiAoIWYyZnNfZGlzYWJsZV9jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IC0gICAgICAgZjJmc19wcmVjYWNo
ZV9leHRlbnRzKGlub2RlKTsKPiAtCj4gICAgICAgICByZXQgPSBmaWxlbWFwX2ZkYXRhd3JpdGUo
aW5vZGUtPmlfbWFwcGluZyk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPgo+ICsgICAgICAgZjJmc19wcmVjYWNoZV9leHRlbnRzKGlub2RlKTsK
PiArCj4gICAgICAgICByZXQgPSBjaGVja19zd2FwX2FjdGl2YXRlKHNpcywgZmlsZSwgc3Bhbik7
Cj4gICAgICAgICBpZiAocmV0IDwgMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAt
LQo+IDIuNDAuMQo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
