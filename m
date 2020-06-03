Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D91ECA2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 09:06:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgNTx-0001lS-AX; Wed, 03 Jun 2020 07:06:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jgNTw-0001kz-L5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 07:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UFCTIuaj8xz+aKHpreeFlNyCdIKgQpq07UVVXvstL7I=; b=NGXVVComcNKzU2v5OnvTRE6L8n
 nPJsbedyTUk5s/RMcUttl3DL146UoTZoAEahwPLy6C7jMl8agC8n9ZRfZHfyX0OkWETbQdI7pcDhg
 L3W7kSOQ5mybol24FoTC0uXb3T65pDJlGvxSTFnaY1ffFyYqWpMG3nr7neU2aewZShPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UFCTIuaj8xz+aKHpreeFlNyCdIKgQpq07UVVXvstL7I=; b=Dp8SFHi+JKxmPKQdfDnp03gDem
 XVuqsPcEX3TUpAv2e7257VDh2KCOep8IwMJxoevh7zmoZQzVu37BHcpVGOmLbn85hfwmiEonnZI0d
 jB8Y4DmdxuJjAyEWIoZ4aXfz4ai9+20lAiGplbXdJSNMZgcuA7RUjleH/4+Up1GMULjc=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNTu-00ACDC-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 07:06:36 +0000
Received: by mail-lf1-f66.google.com with SMTP id j12so642459lfh.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UFCTIuaj8xz+aKHpreeFlNyCdIKgQpq07UVVXvstL7I=;
 b=UxBiurAZREXPM1HURsDXeYCy3qhAcKEZrySeaFpPyV87adNdAKo0BKKYlwWq2IHwfm
 0yQSrZDcAsHv8HDwYjfllWB/TnnK1+gQYE9/JODt80oWHfaCr74epyYzWYK4UGPOLo6I
 TfpZjUzYdLG8NiurklMPPvLtL5jUecgKiBdluuf9d7aCk5EGzoZqIf2PURl3j+vsdfci
 idmGOrK1kTD/Qdia/QpWXC2sYkeUCZ+KMNfElBydHvXfi+HJyJA/xdNN7SD9CDeLWAPm
 5MaaaYe/msa6giALcnqvYPEplF7GnA9QFk3USsXLxptgYah4UkV3zrwmF0LOvtpEm/5a
 8sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UFCTIuaj8xz+aKHpreeFlNyCdIKgQpq07UVVXvstL7I=;
 b=diy1dPoT52S9K9nuRg79RSjWQI9qpW+llzNaHfO4s/GWVsPpNXXFhjqXo/GNlNbK1I
 Oyzq9JBCMee+kVZPPmK5Duatk4M/w4xutUrDUc77Pel9+32Bjno+y9Ov6MQSZA+8p7Ej
 NSj+6Ap+dN+XIDHbfru9fTvrHsC9wDg17iZwU1jqmhv4I3TZXp0IWOUb3JH3ix0RwhOs
 bVwqTCYh1BkHEso7Gu6PpEaiw1zqQ+N/A8ZE3mViYvB118Oa+F26wqdTOnbuUDt1/77D
 T+qIsEiLS7ohvWg9EE0Mu6LJoJ+MeWZpK15GMrmUOKLRNLYVFYls+FycJriLfpkfv8Uj
 YTEQ==
X-Gm-Message-State: AOAM531ber7in+phXeB364zuquKpEgY6A7dMiF8tO2nanmKdvBI/aedU
 Eobiril9HM2rCVsvpJRSTCJYe6CxdiqYkLyOVhg=
X-Google-Smtp-Source: ABdhPJxAvNz3NC+UHfmFFv9r88vxizSW78ZxovGrxdKJJEDiA7ur1ngsxO6bJfwsgg9V7vZjf/WF1eyiGNzGnOsEkEs=
X-Received: by 2002:a19:fc15:: with SMTP id a21mr1641142lfi.121.1591167987856; 
 Wed, 03 Jun 2020 00:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200601030347.112984-1-daeho43@gmail.com>
 <daed6176-fb7d-bd4d-9662-735cc3cda2e0@huawei.com>
In-Reply-To: <daed6176-fb7d-bd4d-9662-735cc3cda2e0@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 3 Jun 2020 16:06:15 +0900
Message-ID: <CACOAw_xgcevW9-xKHq-siDa-1i-Nap+rQQOpZ9LWyfbGkEmV=g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jgNTu-00ACDC-Ln
Subject: Re: [f2fs-dev] [PATCH] f2fs: protect new segment allocation in
 expand_inode_data
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

T2gsIHRoYW5rcyBmb3Igbm90aWZpY2F0aW9uIQoKMjAyMOuFhCA27JuUIDPsnbwgKOyImCkg7Jik
7ZuEIDM6NTksIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4g
T24gMjAyMC82LzEgMTE6MDMsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVv
bmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBGb3VuZCBhIG5ldyBzZWdlbW50IGFs
bG9jYXRpb24gd2l0aG91dCBmMmZzX2xvY2tfb3AoKSBpbgo+ID4gZXhwYW5kX2lub2RlX2RhdGEo
KS4gU28sIHdoZW4gd2UgZG8gZmFsbG9jYXRlKCkgZm9yIGEgcGlubmVkIGZpbGUKPiA+IGFuZCB0
cmlnZ2VyIGNoZWNrcG9pbnQgdmVyeSBmcmVxdWVudGx5IGFuZCBzaW11bHRhbmVvdXNseS4gRjJG
UyBnZXRzCj4gPiBzdHVjayBpbiB0aGUgYmVsb3cgY29kZSBvZiBkb19jaGVja3BvaW50KCkgZm9y
ZXZlci4KPiA+Cj4gPiAgIGYyZnNfc3luY19tZXRhX3BhZ2VzKHNiaSwgTUVUQSwgTE9OR19NQVgs
IEZTX0NQX01FVEFfSU8pOwo+ID4gICAvKiBXYWl0IGZvciBhbGwgZGlydHkgbWV0YSBwYWdlcyB0
byBiZSBzdWJtaXR0ZWQgZm9yIElPICovCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8PSBpZiBmYWxsb2NhdGUoKSBoZXJlLAo+ID4gICBmMmZzX3dh
aXRfb25fYWxsX3BhZ2VzKHNiaSwgRjJGU19ESVJUWV9NRVRBKTsgPD0gaXQnbGwgd2FpdCBmb3Jl
dmVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+Cj4g
RGFlaG8sCj4KPiBJIGd1ZXNzIEphZWdldWsgY291bGQgYWRkIHRoZSB0YWcgd2hlbiBtZXJnaW5n
IHRoaXMgcGF0Y2gsIHdlIGRvbid0IGhhdmUKPiB0byByZXNlbmQgdGhlIHBhdGNoIGlmIHRoZXJl
IGlzIG5vIHVwZGF0ZXMgb24gY29kZSBhbmQgbWVzc2FnZS4KPgo+IFRoYW5rcywKPgo+ID4gLS0t
Cj4gPiAgZnMvZjJmcy9maWxlLmMgfCA0ICsrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9m
aWxlLmMKPiA+IGluZGV4IGY3ZGUyYTFkYTUyOC4uMTRhY2U4ODViYWE5IDEwMDY0NAo+ID4gLS0t
IGEvZnMvZjJmcy9maWxlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtMTY2MCw3
ICsxNjYwLDExIEBAIHN0YXRpYyBpbnQgZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0IGlub2RlICpp
bm9kZSwgbG9mZl90IG9mZnNldCwKPiA+Cj4gPiAgICAgICAgICAgICAgIGRvd25fd3JpdGUoJnNi
aS0+cGluX3NlbSk7Cj4gPiAgICAgICAgICAgICAgIG1hcC5tX3NlZ190eXBlID0gQ1VSU0VHX0NP
TERfREFUQV9QSU5ORUQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGYyZnNfbG9ja19vcChzYmkp
Owo+ID4gICAgICAgICAgICAgICBmMmZzX2FsbG9jYXRlX25ld19zZWdtZW50cyhzYmksIENVUlNF
R19DT0xEX0RBVEEpOwo+ID4gKyAgICAgICAgICAgICBmMmZzX3VubG9ja19vcChzYmkpOwo+ID4g
Kwo+ID4gICAgICAgICAgICAgICBlcnIgPSBmMmZzX21hcF9ibG9ja3MoaW5vZGUsICZtYXAsIDEs
IEYyRlNfR0VUX0JMT0NLX1BSRV9ESU8pOwo+ID4gICAgICAgICAgICAgICB1cF93cml0ZSgmc2Jp
LT5waW5fc2VtKTsKPiA+Cj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
