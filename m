Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17957CC077D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 02:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiZ+OPN5DYVzCkdkUfltDnr2KRljc4UVqaissDZMCww=; b=JKcxzx3nhn8Im4CIhd7hrxCq4Q
	IwlYI+7gSC6QmSVcf/k5P8PJ70hrHMNTlDx321jkhEVQww70P6BxwKG7K+QnPvRRzTelLuCu5hP9a
	SJp6ELBexlbUAcYiQAIDDGVUtsAkRE1g57orWtiFBvLDYT/SY1Dd1WYkYMi7KpjOcrAA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVJzv-0006cf-Nh;
	Tue, 16 Dec 2025 01:37:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1vVJzt-0006cN-Sd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 01:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/2g+NfP/QHzXry9KioxuOX0zh3InqDOtbGBy5vfIRqA=; b=CC7oXWnn5w1hCQyDFWRp+SlxS3
 Cl6eWsIMQ5ZR/1EX5IET7t94HmCop36mIbd6HazXWrhI2nhJO7vjN6ZXxm8HbA50liOLrrT0f3C6d
 9ozNKWGEejrsjwFbZfZHmaAyHth6E8DyRyeM5/hPrKxD8sxQkNV+UR6HF76CXRdtlD8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/2g+NfP/QHzXry9KioxuOX0zh3InqDOtbGBy5vfIRqA=; b=OfT6jaCZsJEPsqxZzOJPgwYfEf
 2O8DfziVxD+djNMmAz0yWpfnadSGiRuEAPtqOL9q0RLBcomfeKskg4Xx78fp5wwOqv45vFIEbX/8C
 3l4NZ/6cjpKvpsgWPBlk7Bw5zcP+gABCarrZNlWvBxLt64Uaw5fOh0316KKKVGKE04/o=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vVJzt-0000j4-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 01:37:06 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47a9567bcd9so2660035e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 17:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765849014; x=1766453814; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/2g+NfP/QHzXry9KioxuOX0zh3InqDOtbGBy5vfIRqA=;
 b=eS0dGI6GQM0nlylJrqHY+4CxyyXvO4PGh6LuT7MRMiwegP8cWk65xneVSBQvqTo09p
 +AwfOWs6V3xrUMXfbHmoGn08pbC1+7ddUFqKT4XLB9DHz/+vTlD71aowGRpEYJ26OdKM
 LwvNVOXeSl+tTtylMgwx8nLKEngJtuL+0Lt4EH1ni2IkeO5j+/C9smQ7hfnwa9Srmeok
 QdTGWgY/nB0NDMVpL4JarXyN0YnZ/VuyLuUgpVFVdwn8ITS2K4bRKcFb7BoOkGbLCHT4
 QA7MUN1iiG+ImUs6LtP3hX+mx64AyjBagAfRUqlwLt9vebucBdRNNY1Z7v4ccdFHavkb
 KsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765849014; x=1766453814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/2g+NfP/QHzXry9KioxuOX0zh3InqDOtbGBy5vfIRqA=;
 b=oeq16Vt8AyJ7wU5vY1L2OmKlg9fXYRDomPXtfIjOd19FH9n0xRbFiF62QSEGxZOF9e
 YNyR6xtIrIjg6MwUB8OXSruNy/dA+bfNhUpDYjtkbmXJCDV18KlP47sDXWL9EngKoPXR
 6bmDH2xaKeK3ZtWAIqlx8sw3uSx+hp9aKMAMykEvXBZUS9OByg7BHMWZdq+co+S2hupm
 N+BbuF1w8QlN2cxZQ46oBUuNSgkFpbEEncABSIZXi1K77XBTm3najcn3StleUqBapPTS
 mC0YiKkM7+5bLn4TQrDeV4jx7KSn7giWCQOHULNj9xx1qpBEU7ZVkOWC7TJw3VaYxWYy
 sTUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmkZgggdpVgMDk+qAfRQeHBoWAgIuDBPmO64A5kR5qt+2Re0jK+CbD/NGajDQ//PSQGbq1QtdcJEC4ANy6un2S@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx0/oDOJNS232txKnj9ySeWoFlbSEWmtLGgrKpAUnC9TrEON2z8
 Le86KCtY3Ge0scctMMdmRqwtswcbfnTb4teGrfVUIbHZAeGGEs9NfhvyQYBgCXwKbzCtiXWbVQH
 nZSAplEKBGk67j3x2KgDEDfmnD0CVwic=
X-Gm-Gg: AY/fxX41b77LP8JI4glO7C/XT09IzaNO/MWVLKqrnp4UamhRlcLF114bpDH54aB0mDG
 8LSvGK72D+DGLwIx35seSSi4kfLqrqljl9SkNjJuaAugnjVMSHwoVg1rwuv5ivyB1D8jDel70AF
 F+ERpk+hwS/AjATz6ScEwjuOqQ/8icbi2lj8eAMvs/lFLvMA3pJwejeaPsYoGVPTjFv2YF6LCdo
 epVTBsy+YRZ8NZDcXIHh/HOG9bL8MuFAJPS9NLDl2r5romRee53Gd+bpwBggf5shAU+A6gdD1c2
 81oaKOQ=
X-Google-Smtp-Source: AGHT+IEFD5M5XZyDpaTIi7d79WdtEiV+Qgha4obUjfsuFWrcMFCS5Vt4pGyQcIG6sS7WsC/ujFc7SQcAiD4rGM1viiA=
X-Received: by 2002:a05:600c:3e08:b0:477:9d54:58ce with SMTP id
 5b1f17b1804b1-47a8f8d728cmr93421415e9.1.1765849014161; Mon, 15 Dec 2025
 17:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20251215122830.3495475-1-chao@kernel.org>
In-Reply-To: <20251215122830.3495475-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 16 Dec 2025 09:36:43 +0800
X-Gm-Features: AQt7F2rYr536AQfZFRNEFesKwAGDGgMFvJEVNjAR7KnSaqVh0Kg1hspnR7oJYMI
Message-ID: <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年12月15日周一 20:34写道：
    > > In order to avoid loading corrupted nat entry from disk. > > Cc: stable@kernel.org
    > Signed-off-by: Chao Yu > --- > fs/f2 [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.45 listed in wl.mailspike.net]
X-Headers-End: 1vVJzt-0000j4-Ta
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid
 in f2fs_get_node_info()
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
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQxMuaciDE15pel5ZGo5LiAIDIwOjM05YaZ6YGT77yaCj4K
PiBJbiBvcmRlciB0byBhdm9pZCBsb2FkaW5nIGNvcnJ1cHRlZCBuYXQgZW50cnkgZnJvbSBkaXNr
Lgo+Cj4gQ2M6IHN0YWJsZUBrZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZzL25vZGUuYyB8IDkgKysrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+IGluZGV4IGNlNDcxZTAzMzc3
NC4uMTNjODhkZmQ3OTBkIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4gKysrIGIvZnMv
ZjJmcy9ub2RlLmMKPiBAQCAtNjMwLDE0ICs2MzAsMTUgQEAgaW50IGYyZnNfZ2V0X25vZGVfaW5m
byhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIG5pZF90IG5pZCwKPiAgICAgICAgIG5vZGVfaW5m
b19mcm9tX3Jhd19uYXQobmksICZuZSk7Cj4gICAgICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywg
dHJ1ZSk7Cj4gIHNhbml0eV9jaGVjazoKPiAtICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihuaS0+YmxrX2FkZHIpICYmCj4gKyAgICAgICBpZiAodW5saWtlbHkobmktPm5pZCAhPSBu
aWQgfHwKSGkgQ2hhbywKKG5pLT5uaWQ9PW5pZCkgc2hvdWxkIGJlIGFsd2F5cyB0cnVlPyBiZWNh
dXNlIHRoZSBjb2RlOgoKbmktPmZsYWcgPSAwOwpuaS0+bmlkID0gbmlkOwpyZXRyeToKb3IgYW0g
SSBtaXNzaW5nIHNvbWV0aGluZz8KCj4gKyAgICAgICAgICAgICAgIChfX2lzX3ZhbGlkX2RhdGFf
YmxrYWRkcihuaS0+YmxrX2FkZHIpICYmCmJ0dywgSXMgaXQgcG9zc2libGUgdG8gZGV0ZWN0IHRo
YXQgc29tZSB2YWxpZCBOaWQgZW50cmllcyBjb250YWluCmluY29ycmVjdCBjb250ZW50PwpzdWNo
IGFzICBpbm8vYmxvY2tfYWRkcj1OVUxMX0FERFIgaW4gbmlkPTQgZW50cnk/ClRoYW5rcwo+ICAg
ICAgICAgICAgICAgICAhZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgbmktPmJsa19hZGRyLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEQVRBX0dFTkVSSUNfRU5I
QU5DRSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9H
RU5FUklDX0VOSEFOQ0UpKSkpIHsKPiAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwg
U0JJX05FRURfRlNDSyk7Cj4gICAgICAgICAgICAgICAgIGYyZnNfZXJyX3JhdGVsaW1pdGVkKHNi
aSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAiZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzog
aW5jb25zaXN0ZW50IG5hdCBlbnRyeSwgIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICJmMmZz
X2dldF9ub2RlX2luZm8gb2YgJXBTOiBuaWQ6JXUsIGluY29uc2lzdGVudCBuYXQgZW50cnksICIK
PiAgICAgICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUsIGJsa2FkZHI6JXUsIHZl
cjoldSwgZmxhZzoldSIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgX19idWlsdGluX3JldHVy
bl9hZGRyZXNzKDApLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fYnVpbHRpbl9yZXR1cm5f
YWRkcmVzcygwKSwgbmlkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIG5pLT5pbm8sIG5pLT5u
aWQsIG5pLT5ibGtfYWRkciwgbmktPnZlcnNpb24sIG5pLT5mbGFnKTsKPiAgICAgICAgICAgICAg
ICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FRlNDT1JSVVBURUQ7Cj4gLS0KPiAyLjQ5LjAKPgo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
