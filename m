Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A7339025
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 15:38:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKivQ-0008DR-1D; Fri, 12 Mar 2021 14:38:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lKivO-0008Cb-9M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNaWAC3DABEUbVGxWGplqiDw9dv4NcAFZkElxGgXLyY=; b=FJQ2nOkome/xV/qrTOxUm4Nr1k
 Fo11vSVbf5xDk5wRhIUujlNfgypcjpkA4f7U5jJqxUqUzfIxTgZJ/8BM28+p2jQLOUvX+77QGZ3Zr
 XPc+LEasGDEulG3RWYdNmnMHj0TwsTMAnvS5KTPifIJ6ESFVkDjg6LG5JsHmIOdw+vLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GNaWAC3DABEUbVGxWGplqiDw9dv4NcAFZkElxGgXLyY=; b=mMULCZp5EC3LmUrVWfCE39nSal
 gF4yVBcVsvE+9vAc2IBBu32sNmN0I0p72FwcEx5f1d59892hsIh9lkc1h5C6amuFCeBrwJGijWiai
 BEW/7Z6cisJXjIAQkaSoYhUe5yPCuqd0l1P31aBqawj3tymlhsbCJdI+NO/usMfz99OQ=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lKivD-005s8s-IG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:37:58 +0000
Received: by mail-lf1-f47.google.com with SMTP id 18so46078780lff.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Mar 2021 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GNaWAC3DABEUbVGxWGplqiDw9dv4NcAFZkElxGgXLyY=;
 b=Doao8t2c/aKsTmuZTBLh5f5ZSWI1SZppbw7XI1vdCzqbnmJasNh77UUWwwdSd5C585
 VtfaV5oqpBcKAav/s3mHQ5mxVYc8TZ7zU+rxAQqVbRgeKDUnGi0UhQk/yLFlzAPf0/nz
 SGi81siMWgVQ0Ys9SE0dOvP18HhjnL5DEfuYV8A7+fCnqnGTwSqRh5UlD9lAHN0mQY2U
 syD7Ngg5onbk7VtLALYTcR1/N3Zw8a9iU/iCwiTTBw4IUplY0tJJdathTbhD57W53q98
 NTCe0Z1bLpI5vaPSUTF+IcjMQE48/7Y5nfoYdhrE8VJ2rwBeH3ZjSdX5W8/bCpM2zq/s
 2RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GNaWAC3DABEUbVGxWGplqiDw9dv4NcAFZkElxGgXLyY=;
 b=q5gi38HepMMLrDzEVnTa8F7icmToTn2+ARuoqE711CAGVxwAcJSVrhrQTXmUQF6mlX
 1eB8+Tt9dswQ+AFLExjyCXRl6QshSEcwEWGuQG3gDGyOpQsx64wSzSo//41F/qKLBUDX
 LiIBcCjRIqEa0t5MAEWE36HCG6Geu2F1jqQIAue1VXUXCZUDSWmDXAYZLxhqdlKv8yjW
 5eXR3YR8FdfkIREXyExP341Ua2XjUYi/Nmg15T6tETV6f+Qq6c7VLPF+GHhv1D+pkNAz
 BSI9KFbDznKhTsdp1v04Lm8BvQYqsgF3wuwUF8tDHypcpi6q56+W4DH79vzTFn3ls8E2
 /eEw==
X-Gm-Message-State: AOAM531SjNjSPk3Vn7KDz2QjVzCa80nwCYmkhjLur6xtWfr8QmQJXera
 MhW6UCgpLleRQx6UB30178e0+TvhcA3KNVsXXM8=
X-Google-Smtp-Source: ABdhPJwwl7ZeHIO1/PaLqP5HtlHq/CufvSpEF/oWMuumWKtGzcrJj/qXjjjP/1uJ814d33mZnLHXGUtO+3M7zsogiuI=
X-Received: by 2002:a19:ec1a:: with SMTP id b26mr5257227lfa.610.1615559860904; 
 Fri, 12 Mar 2021 06:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
 <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
 <YEt00vJ6oVfoRjSJ@kroah.com>
In-Reply-To: <YEt00vJ6oVfoRjSJ@kroah.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Mar 2021 23:37:29 +0900
Message-ID: <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.47 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.47 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lKivD-005s8s-IG
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add sysfs nodes to get runtime
 compression stat
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

QXMgeW91IGNhbiBzZWUsIGlmIHdlJ3JlIGRvaW5nIGxpa2UgdGhlIGJlbG93LgoKc2JpLT5jb21w
cl93cml0dGVuX2Jsb2NrICs9IGJsb2NrczsKCkxldCdzIGFzc3VtZSB0aGUgaW5pdGlhbCB2YWx1
ZSBhcyAwLgoKPHRocmVhZCBBPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDx0aHJlYWQgQj4Kc2JpLT5jb21wcl93cml0dGVuX2Jsb2NrID0gMDsKCnNiaS0+Y29t
cHJfd3JpdHRlbl9ibG9jayA9IDA7CitibG9ja3MoMyk7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsgYmxvY2tzKDIpOwpzYmkt
PmNvbXByX3dyaXR0ZW5fYmxvY2sgPSAzOwoKc2JpLT5jb21wcl93cml0dGVuX2Jsb2NrID0gMjsK
CkZpbmFsbHksIHdlIGVuZCB1cCB3aXRoIDIsIG5vdCA1LgoKQXMgbW9yZSB0aHJlYWRzIGFyZSBw
YXJ0aWNpcGF0aW5nIGl0LCB3ZSBtaWdodCBtaXNzIG1vcmUgY291bnRpbmcuCgoyMDIx64WEIDPs
m5QgMTLsnbwgKOq4iCkg7Jik7ZuEIDExOjA0LCBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gRnJpLCBNYXIgMTIsIDIwMjEgYXQgMTA6NTY6
MTNQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBUaGFua3MgZm9yIHN1Z2dlc3Rpbmcg
bWUgc3lzZnNfZW1pdCgpLgo+ID4KPiA+IEZvciBhdG9taWMgdmFsdWVzLCBhY3R1YWxseSwgdGhv
c2UgYXJlIG5lZWRlZCBmb3Igd3JpdGVyIHBhcnQsIG5vdCByZWFkZXIuCj4gPgo+ID4gKyNkZWZp
bmUgYWRkX2NvbXByX2Jsb2NrX3N0YXQoaW5vZGUsIGJsb2NrcykgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7ICAgICAgICAgICAgXAo+ID4g
KyAgICAgICAgICAgICAgIGludCBkaWZmID0gRjJGU19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemUg
LSBibG9ja3M7ICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGF0b21pYzY0X2FkZChibG9ja3Ms
ICZzYmktPmNvbXByX3dyaXR0ZW5fYmxvY2spOyAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAg
IGF0b21pYzY0X2FkZChkaWZmLCAmc2JpLT5jb21wcl9zYXZlZF9ibG9jayk7ICAgICAgICAgICAg
XAo+ID4gKyAgICAgICB9IHdoaWxlICgwKQo+ID4KPiA+IEkgbmVlZGVkIGEgcHJvdGVjdGlvbiBo
ZXJlLCBiZWNhdXNlIHRoZXkgbWlnaHQgYmUgdXBkYXRlZCBpbiB0aGUgcmFjZSBjb25kaXRpb24u
Cj4KPiBXaHk/ICBXaGF0IGFyZSB5b3UgdHJ5aW5nIHRvIHByb3RlY3QgZnJvbSAicmFjaW5nIiBo
ZXJlPwo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
