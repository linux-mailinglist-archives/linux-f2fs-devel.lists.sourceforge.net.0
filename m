Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700010D0AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 04:35:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaX48-0005zO-LL; Fri, 29 Nov 2019 03:35:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1iaX46-0005z6-It
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 03:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QJ0BehjFJkWJyP8RtCONd9xszCsERb/O9WmeExTQd5k=; b=b7CMuKUz8/m9RlnI8RnW86Tigp
 G3XMleeJ1GrgCFuqxJvtDEZkCfxiFNYygX+Z+UI37z0npdalWv2ChZQTLXtSqfLv//nHqf/fuJIeF
 zH0yXSkq5GilxPtkcDmuRzt6EgKH7AxW0H7nEZ2VMXJ/19K/R9SidkqAasBvNfODCVdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QJ0BehjFJkWJyP8RtCONd9xszCsERb/O9WmeExTQd5k=; b=fuldpqyUV4G8twloGxBH7DlCYn
 dP+UW6HB1GCRaqGdqx1+Lz987rD362CdwDoIvqcc7fyxTgXPy2sZONyUayGHNnJy1v4p4CWpB6ilF
 7pOOPkLaSNFY4Bxqup0eCSCNmCDvvmH0fz4/OKih7184qnUA9T6wRBG5hLHbiY5qzkmg=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iaX40-00H0JW-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 03:35:30 +0000
Received: by mail-wm1-f67.google.com with SMTP id n5so13455301wmc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Nov 2019 19:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QJ0BehjFJkWJyP8RtCONd9xszCsERb/O9WmeExTQd5k=;
 b=QfkEgP0LSNnXnXJcK7sI02htl820DB5bfsY47OwRNyzmGbQX/PzK/FxsZx3bI28akq
 LeDtDTO+1gBXwVGMvLEnATIxv7qa7CjbeB0ls0dcWEM78aKuIiAPgr2fcnEL7efCNIgQ
 KsbuiUjKC4h/6cCfw7Y+LWD+RHGWQS35wN2Dlb/F+3qx7SbAInmdwnRtQgCF33LeVFby
 RmHDDK6gVQpiZb+mqxjyG4hYbCTcncu3C3OlFxGou2TT8n/6sBG6aWB0dsQ5+iMuy8Jo
 Sa924LLfQY3/gWJ5RWOzAjTBjsgu5fS7Ti1KvcBpxmvI6r8ackcKQW+IabakzoOM3mZx
 ZSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QJ0BehjFJkWJyP8RtCONd9xszCsERb/O9WmeExTQd5k=;
 b=OKU/pabYHjEXnQ0BX/wUjQQHXMwFglQVtrGmN+9HtyI9HkbWnWdEegMeONnRqvH164
 Lw+SQ6UKYHVzPeC/ZoAiEvqE6fNdhp7XaHf+4gIeV073NXzm17qSJL5kWOFRse9GYJrL
 MquRIv8ud7WEN4ssBju1q7inNhYlGcey3+z+sfxMsRxyEq+MsygL8VJ1S7ASIZecD12g
 7poksYgyw5vfC2vKQFkFwkF0GydqhIdnV/X4exz+EfNQbyVjY3f4pqGcHk6eym+ViYve
 6qZCLztgaWqXevYfY+qYkowvxz4K1lBpHH8zQS2C4XhBlryUKiQoyqvtFoTWyuwMuO/4
 e4AQ==
X-Gm-Message-State: APjAAAWYcQFdj2pBGqtZm02w98wwuKHr13QXc4/BtrxFV5Y/vVR7mohI
 hUP+jSNVNJLBdrYOtt0c/8QJxw==
X-Google-Smtp-Source: APXvYqyY5Ag9efnLxT+G22Uef6sbiZvKYbuON7L6+paT+DCwuPK/MrDIWZduK2bBn25khLS06VtYyA==
X-Received: by 2002:a1c:3941:: with SMTP id g62mr11971950wma.165.1574998517292; 
 Thu, 28 Nov 2019 19:35:17 -0800 (PST)
Received: from localhost (ip-5-186-122-168.cgn.fibianet.dk. [5.186.122.168])
 by smtp.gmail.com with ESMTPSA id x9sm25131773wru.32.2019.11.28.19.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 19:35:16 -0800 (PST)
Date: Fri, 29 Nov 2019 04:35:15 +0100
From: Javier Gonzalez <javier@javigon.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191129033515.ehkdf65toblntkrq@MacBook-Pro.gnusmas>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [5.186.122.168 listed in zen.spamhaus.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaX40-00H0JW-Ro
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjYuMTEuMjAxOSAxNTo0NCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj5PbiAxMS8yNiwgRGFtaWVu
IExlIE1vYWwgd3JvdGU6Cj4+IGYyZnNfcHJlYWxsb2NhdGVfYmxvY2tzKCkgaWRlbnRpZmllcyBk
aXJlY3QgSU9zIHVzaW5nIHRoZSBJT0NCX0RJUkVDVAo+PiBmbGFnIGZvciBhIGtpb2NiIHN0cnVj
dHVyZS4gSG93ZXZlciwgdGhlIGZpbGUgc3lzdGVtIGRpcmVjdCBJTyBoYW5kbGVyCj4+IGZ1bmN0
aW9uIGYyZnNfZGlyZWN0X0lPKCkgbWF5IGhhdmUgZGVjaWRlZCB0aGF0IGEgZGlyZWN0IElPIGhh
cyB0byBiZQo+PiBleGVjZWN1dGVkIGFzIGEgYnVmZmVyZWQgSU8gdXNpbmcgdGhlIGZ1bmN0aW9u
IGYyZnNfZm9yY2VfYnVmZmVyZWRfaW8oKS4KPj4gVGhpcyBpcyB0aGUgY2FzZSBmb3IgaW5zdGFu
Y2UgZm9yIHZvbHVtZXMgaW5jbHVkaW5nIHpvbmVkIGJsb2NrIGRldmljZQo+PiBhbmQgZm9yIHVu
YWxpZ25lZCB3cml0ZSBJT3Mgd2l0aCBMRlMgbW9kZSBlbmFibGVkLgo+Pgo+PiBUaGVzZSAyIGRp
ZmZlcmVudCBtZXRob2RzIG9mIGlkZW50aWZ5aW5nIGRpcmVjdCBJT3MgY2FuIHJlc3VsdCBpbgo+
PiBpbmNvbnNpc3RlbmNpZXMgZ2VuZXJhdGluZyBzdGFsZSBkYXRhIGFjY2VzcyBmb3IgZGlyZWN0
IHJlYWRzIGFmdGVyIGEKPj4gZGlyZWN0IElPIHdyaXRlIHRoYXQgaXMgdHJlYXRlZCBhcyBhIGJ1
ZmZlcmVkIHdyaXRlLiBGaXggdGhpcwo+PiBpbmNvbnNpc3RlbmN5IGJ5IGNvbWJpbmluZyB0aGUg
SU9DQl9ESVJFQ1QgZmxhZyB0ZXN0IHdpdGggdGhlIHJlc3VsdAo+PiBvZiBmMmZzX2ZvcmNlX2J1
ZmZlcmVkX2lvKCkuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBKYXZpZXIgR29uemFsZXogPGphdmllckBq
YXZpZ29uLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1v
YWxAd2RjLmNvbT4KPj4gLS0tCj4+ICBmcy9mMmZzL2RhdGEuYyB8IDQgKysrLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+PiBpbmRleCA1NzU1ZTg5N2E1ZjAu
LjhhYzJkM2I3MDAyMiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4gKysrIGIvZnMv
ZjJmcy9kYXRhLmMKPj4gQEAgLTEwNzMsNiArMTA3Myw4IEBAIGludCBmMmZzX3ByZWFsbG9jYXRl
X2Jsb2NrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPj4gIAlp
bnQgZmxhZzsKPj4gIAlpbnQgZXJyID0gMDsKPj4gIAlib29sIGRpcmVjdF9pbyA9IGlvY2ItPmtp
X2ZsYWdzICYgSU9DQl9ESVJFQ1Q7Cj4+ICsJYm9vbCBkb19kaXJlY3RfaW8gPSBkaXJlY3RfaW8g
JiYKPj4gKwkJIWYyZnNfZm9yY2VfYnVmZmVyZWRfaW8oaW5vZGUsIGlvY2IsIGZyb20pOwo+Pgo+
PiAgCS8qIGNvbnZlcnQgaW5saW5lIGRhdGEgZm9yIERpcmVjdCBJL08qLwo+PiAgCWlmIChkaXJl
Y3RfaW8pIHsKPj4gQEAgLTEwODEsNyArMTA4Myw3IEBAIGludCBmMmZzX3ByZWFsbG9jYXRlX2Js
b2NrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPj4gIAkJCXJl
dHVybiBlcnI7Cj4+ICAJfQo+Pgo+PiAtCWlmIChkaXJlY3RfaW8gJiYgYWxsb3dfb3V0cGxhY2Vf
ZGlvKGlub2RlLCBpb2NiLCBmcm9tKSkKPj4gKwlpZiAoZG9fZGlyZWN0X2lvICYmIGFsbG93X291
dHBsYWNlX2Rpbyhpbm9kZSwgaW9jYiwgZnJvbSkpCj4KPkl0IHNlZW1zIGYyZnNfZm9yY2VfYnVm
ZmVyZWRfaW8oKSBpbmNsdWRlcyBhbGxvd19vdXRwbGFjZV9kaW8oKS4KPgo+SG93IGFib3V0IHRo
aXM/Cj4tLS0KPiBmcy9mMmZzL2RhdGEuYyB8IDEzIC0tLS0tLS0tLS0tLS0KPiBmcy9mMmZzL2Zp
bGUuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gMiBmaWxlcyBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPmluZGV4IGEwMzRjZDBjZTAyMS4uZmM0
MGE3MmY3ODI3IDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9kYXRhLmMKPisrKyBiL2ZzL2YyZnMvZGF0
YS5jCj5AQCAtMTE4MCwxOSArMTE4MCw2IEBAIGludCBmMmZzX3ByZWFsbG9jYXRlX2Jsb2Nrcyhz
dHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAJaW50IGVyciA9IDA7
Cj4gCWJvb2wgZGlyZWN0X2lvID0gaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVDsKPgo+LQkv
KiBjb252ZXJ0IGlubGluZSBkYXRhIGZvciBEaXJlY3QgSS9PKi8KPi0JaWYgKGRpcmVjdF9pbykg
ewo+LQkJZXJyID0gZjJmc19jb252ZXJ0X2lubGluZV9pbm9kZShpbm9kZSk7Cj4tCQlpZiAoZXJy
KQo+LQkJCXJldHVybiBlcnI7Cj4tCX0KPi0KPi0JaWYgKGRpcmVjdF9pbyAmJiBhbGxvd19vdXRw
bGFjZV9kaW8oaW5vZGUsIGlvY2IsIGZyb20pKQo+LQkJcmV0dXJuIDA7Cj4tCj4tCWlmIChpc19p
bm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fUFJFQUxMT0MpKQo+LQkJcmV0dXJuIDA7Cj4tCj4g
CW1hcC5tX2xibGsgPSBGMkZTX0JMS19BTElHTihpb2NiLT5raV9wb3MpOwo+IAltYXAubV9sZW4g
PSBGMkZTX0JZVEVTX1RPX0JMSyhpb2NiLT5raV9wb3MgKyBpb3ZfaXRlcl9jb3VudChmcm9tKSk7
Cj4gCWlmIChtYXAubV9sZW4gPiBtYXAubV9sYmxrKQo+ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMKPmluZGV4IGMwNTYwZDYyZGJlZS4uNmIzMmFjNmMzMzgyIDEw
MDY0NAo+LS0tIGEvZnMvZjJmcy9maWxlLmMKPisrKyBiL2ZzL2YyZnMvZmlsZS5jCj5AQCAtMzM4
NiwxOCArMzM4NiwzMyBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX2ZpbGVfd3JpdGVfaXRlcihzdHJ1
Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAJCQkJcmV0ID0gLUVBR0FJ
TjsKPiAJCQkJZ290byBvdXQ7Cj4gCQkJfQo+LQkJfSBlbHNlIHsKPi0JCQlwcmVhbGxvY2F0ZWQg
PSB0cnVlOwo+LQkJCXRhcmdldF9zaXplID0gaW9jYi0+a2lfcG9zICsgaW92X2l0ZXJfY291bnQo
ZnJvbSk7Cj4rCQkJZ290byB3cml0ZTsKPisJCX0KPgo+LQkJCWVyciA9IGYyZnNfcHJlYWxsb2Nh
dGVfYmxvY2tzKGlvY2IsIGZyb20pOwo+LQkJCWlmIChlcnIpIHsKPi0JCQkJY2xlYXJfaW5vZGVf
ZmxhZyhpbm9kZSwgRklfTk9fUFJFQUxMT0MpOwo+LQkJCQlpbm9kZV91bmxvY2soaW5vZGUpOwo+
LQkJCQlyZXQgPSBlcnI7Cj4tCQkJCWdvdG8gb3V0Owo+LQkJCX0KPisJCWlmIChpc19pbm9kZV9m
bGFnX3NldChpbm9kZSwgRklfTk9fUFJFQUxMT0MpKQo+KwkJCWdvdG8gd3JpdGU7Cj4rCj4rCQlp
ZiAoaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVCkgewo+KwkJCS8qIGNvbnZlcnQgaW5saW5l
IGRhdGEgZm9yIERpcmVjdCBJL08qLwo+KwkJCWVyciA9IGYyZnNfY29udmVydF9pbmxpbmVfaW5v
ZGUoaW5vZGUpOwo+KwkJCWlmIChlcnIpCj4rCQkJCWdvdG8gb3V0X2VycjsKPisKPisJCQlpZiAo
IWYyZnNfZm9yY2VfYnVmZmVyZWRfaW8oaW5vZGUsIGlvY2IsIGZyb20pKQo+KwkJCQlnb3RvIHdy
aXRlOwo+KwkJfQo+KwkJcHJlYWxsb2NhdGVkID0gdHJ1ZTsKPisJCXRhcmdldF9zaXplID0gaW9j
Yi0+a2lfcG9zICsgaW92X2l0ZXJfY291bnQoZnJvbSk7Cj4rCj4rCQllcnIgPSBmMmZzX3ByZWFs
bG9jYXRlX2Jsb2Nrcyhpb2NiLCBmcm9tKTsKPisJCWlmIChlcnIpIHsKPitvdXRfZXJyOgo+KwkJ
CWNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX1BSRUFMTE9DKTsKPisJCQlpbm9kZV91bmxv
Y2soaW5vZGUpOwo+KwkJCXJldCA9IGVycjsKPisJCQlnb3RvIG91dDsKPiAJCX0KPit3cml0ZToK
PiAJCXJldCA9IF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIoaW9jYiwgZnJvbSk7Cj4gCQljbGVh
cl9pbm9kZV9mbGFnKGlub2RlLCBGSV9OT19QUkVBTExPQyk7Cj4KPi0tIAo+Mi4xOS4wLjYwNS5n
MDFkMzcxZjc0MS1nb29nCj4KVGhpcyBhbHNvIGFkZHJlc3NlcyB0aGUgb3JpZ2luYWwgcHJvYmxl
bS4KClRlc3RlZC1ieTogSmF2aWVyIEdvbnrDoWxleiA8amF2aWVyQGphdmlnb24uY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
