Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C3338F37
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 14:56:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKiHP-0007wO-Qn; Fri, 12 Mar 2021 13:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lKiHN-0007w4-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 13:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0+cQI6IBGeUFnwRLsME/R/tm5JUnpBXS5OxVlu71yp4=; b=Jbf9Y4PpYsMIOT5gldIIbY7O2Y
 Z3egGzVHhtJGTXTPa/tgWXrhYuUJ07bZG8+1/tVpIQs5Y6boVO3P96YNWQ64JFG6voOm7QOhLgK/j
 wLAx8zc18Z0kGolc21HVaD2hdG2mwij5CjXS4BlDiZNICxZbbcYZXAxL9Kx4zzBL2Mn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0+cQI6IBGeUFnwRLsME/R/tm5JUnpBXS5OxVlu71yp4=; b=KYFCmufOpXuoHviulC0Q4f2s0B
 LqWZYuFFnT9umnNoRLnnbSA/uLeJWYSLGMC4rJDo4KRchs8cKoeGFGjKnrDagkOrM/+JNlMyfUXX5
 jsQGMSv0iMAeBJJy4XfRBLxNWRh5+uT2jk6J4NyHCYt8dmjODinDR5pRtJQ6Wq6Twdhw=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lKiHH-005hb1-1k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 13:56:37 +0000
Received: by mail-lj1-f172.google.com with SMTP id r20so6845729ljk.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Mar 2021 05:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0+cQI6IBGeUFnwRLsME/R/tm5JUnpBXS5OxVlu71yp4=;
 b=mMF2TVCLPhwVCGaTyiVuCUd6NCDmmTEA7yh9NysOLee4jMJQ7JOY9v36HlbqsabBba
 /FGf3Y7rJJjMyz+xTy0hwTnDzi3Y3cGhrd6FMj5fgVDOHJGtX8BaeLHdY5/jZCPttwRg
 0Zzpc9bV6D+KgPBRRJpQ0+V+Z8Jnv2dHnoJgzgFMV6zz9UplBDRyBuoa2iz/Bwbw0vlO
 eByN3mWN9gvWj1C06T4Fhwb7nRgNYlfQVjJBEt7gtE7okN84k0Viqos1wFh46bkKTMUP
 TJgfhWXfX3+rnruqoByrVH46QnKqiXeJvT0TeafZdZIUtcXp3UwqujUo7O65z+LEiVcj
 i11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0+cQI6IBGeUFnwRLsME/R/tm5JUnpBXS5OxVlu71yp4=;
 b=X4QXDZNBrKRIPscMJO5aiH7ARuf+lz7N+mieWbY8kHR9jdA5tYkeBs7Dud74U2z+D9
 /18dgR+KF/PsnYYmBOeyutZhPrGn/li3oP+Ee8PSReFfUp9gtSqG8I1aDAv9zp1yufQ5
 JULBUTJ+T5Jk9BMyPkgKXI0CI0b1x1tZqBKkGknQINz2pcqFc8PXESHmJRBjrZ7PUzbC
 BIRCtsXDXQIQL1vzFI4GUR31uGDoavFY5kxh9c+y16gJUps6e9n0ICRtO4SO0L2G/Hwh
 iG2pGmRmc5DpGXdhBTwh7JpGTIon/nIGNWE4uQvGj0zbd3sk7JoF4YRN7AYdCOSTqnH2
 qDjA==
X-Gm-Message-State: AOAM533c4pjDu7HeAojXJiwYFiCT0RQ+oUaiyyagg/2322j7xwV8aj2x
 j69SM6GIq4uk7pZHIVG8RbQlFCN6mB14A2mRuvw=
X-Google-Smtp-Source: ABdhPJwffCGWRkIYD6jWDrR+Q0unl67vgMn+0dEdUWWEKjlYNiJpUUJIFaz6I1IKyXmNSfuo/Jf8Ma79sirQ5eT8Hic=
X-Received: by 2002:a2e:a58f:: with SMTP id m15mr2385147ljp.400.1615557384397; 
 Fri, 12 Mar 2021 05:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
In-Reply-To: <YEtg8U7whCVV2tQt@kroah.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Mar 2021 22:56:13 +0900
Message-ID: <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lKiHH-005hb1-1k
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

VGhhbmtzIGZvciBzdWdnZXN0aW5nIG1lIHN5c2ZzX2VtaXQoKS4KCkZvciBhdG9taWMgdmFsdWVz
LCBhY3R1YWxseSwgdGhvc2UgYXJlIG5lZWRlZCBmb3Igd3JpdGVyIHBhcnQsIG5vdCByZWFkZXIu
CgorI2RlZmluZSBhZGRfY29tcHJfYmxvY2tfc3RhdChpbm9kZSwgYmxvY2tzKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCisgICAgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgIHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7ICAgICAgICAgICAgXAorICAg
ICAgICAgICAgICAgaW50IGRpZmYgPSBGMkZTX0koaW5vZGUpLT5pX2NsdXN0ZXJfc2l6ZSAtIGJs
b2NrczsgICAgICBcCisgICAgICAgICAgICAgICBhdG9taWM2NF9hZGQoYmxvY2tzLCAmc2JpLT5j
b21wcl93cml0dGVuX2Jsb2NrKTsgICAgICAgIFwKKyAgICAgICAgICAgICAgIGF0b21pYzY0X2Fk
ZChkaWZmLCAmc2JpLT5jb21wcl9zYXZlZF9ibG9jayk7ICAgICAgICAgICAgXAorICAgICAgIH0g
d2hpbGUgKDApCgpJIG5lZWRlZCBhIHByb3RlY3Rpb24gaGVyZSwgYmVjYXVzZSB0aGV5IG1pZ2h0
IGJlIHVwZGF0ZWQgaW4gdGhlIHJhY2UgY29uZGl0aW9uLgoKMjAyMeuFhCAz7JuUIDEy7J28ICjq
uIgpIOyYpO2bhCA5OjM5LCBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz7ri5js
nbQg7J6R7ISxOgo+Cj4gT24gRnJpLCBNYXIgMTIsIDIwMjEgYXQgMDk6MjU6MzFQTSArMDkwMCwg
RGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+ID4KPiA+IEkndmUgYWRkZWQgbmV3IHN5c2ZzIG5vZGVzIHRvIHNob3cgcnVudGlt
ZSBjb21wcmVzc2lvbiBzdGF0IHNpbmNlIG1vdW50Lgo+ID4gY29tcHJfd3JpdHRlbl9ibG9jayAt
IHNob3cgdGhlIGJsb2NrIGNvdW50IHdyaXR0ZW4gYWZ0ZXIgY29tcHJlc3Npb24KPiA+IGNvbXBy
X3NhdmVkX2Jsb2NrIC0gc2hvdyB0aGUgc2F2ZWQgYmxvY2sgY291bnQgd2l0aCBjb21wcmVzc2lv
bgo+ID4gY29tcHJfbmV3X2lub2RlIC0gc2hvdyB0aGUgY291bnQgb2YgaW5vZGUgbmV3bHkgZW5h
YmxlZCBmb3IgY29tcHJlc3Npb24KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiB2MjogdGhhbmtzIHRvIGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiwgZml4ZWQgY29tcGlsZSBpc3N1ZQo+ID4gICAgIHJl
bGF0ZWQgdG8ga2VybmVsIGNvbmZpZwo+ID4gdjM6IGNoYW5nZWQgc3lzZnMgbm9kZXMnIG5hbWVz
IGFuZCBtYWRlIHRoZW0gcnVudGltZSBzdGF0LCBub3QKPiA+ICAgICBwZXJzaXN0ZW50IG9uIGRp
c2sKPiA+IHY0OiBjaGFuZ2VkIHN5c2ZzIG5vZGVzJyBkZXNjdGlwdGlvbgo+ID4gLS0tCj4gPiAg
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIHwgMjQgKysrKysrKysrKwo+
ID4gIGZzL2YyZnMvY29tcHJlc3MuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBm
cy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrKwo+ID4g
IGZzL2YyZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKwo+ID4gIGZz
L2YyZnMvc3lzZnMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBi
L0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gaW5kZXggY2JlYWMx
YmViZTJmLi5kZGQ0YmQ2MTE2ZmMgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZnMtZjJmcwo+ID4gQEAgLTQwOSwzICs0MDksMjcgQEAgRGVzY3JpcHRpb246ICAgICBH
aXZlIGEgd2F5IHRvIGNoYW5nZSBjaGVja3BvaW50IG1lcmdlIGRhZW1vbidzIGlvIHByaW9yaXR5
Lgo+ID4gICAgICAgICAgICAgICBJL08gcHJpb3JpdHkgIjMiLiBXZSBjYW4gc2VsZWN0IHRoZSBj
bGFzcyBiZXR3ZWVuICJydCIgYW5kICJiZSIsCj4gPiAgICAgICAgICAgICAgIGFuZCBzZXQgdGhl
IEkvTyBwcmlvcml0eSB3aXRoaW4gdmFsaWQgcmFuZ2Ugb2YgaXQuICIsIiBkZWxpbWl0ZXIKPiA+
ICAgICAgICAgICAgICAgaXMgbmVjZXNzYXJ5IGluIGJldHdlZW4gSS9PIGNsYXNzIGFuZCBwcmlv
cml0eSBudW1iZXIuCj4gPiArCj4gPiArV2hhdDogICAgICAgICAgICAgICAgL3N5cy9mcy9mMmZz
LzxkaXNrPi9jb21wcl93cml0dGVuX2Jsb2NrCj4gPiArRGF0ZTogICAgICAgICAgICAgICAgTWFy
Y2ggMjAyMQo+ID4gK0NvbnRhY3Q6ICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cj4gPiArRGVzY3JpcHRpb246IFNob3cgdGhlIGJsb2NrIGNvdW50IHdyaXR0ZW4gYWZ0
ZXIgY29tcHJlc3Npb24gc2luY2UgbW91bnQuIE5vdGUKPiA+ICsgICAgICAgICAgICAgdGhhdCB3
aGVuIHRoZSBjb21wcmVzc2VkIGJsb2NrcyBhcmUgZGVsZXRlZCwgdGhpcyBjb3VudCBkb2Vzbid0
Cj4gPiArICAgICAgICAgICAgIGRlY3JlYXNlLiBJZiB5b3Ugd3JpdGUgIjAiIGhlcmUsIHlvdSBj
YW4gaW5pdGlhbGl6ZQo+ID4gKyAgICAgICAgICAgICBjb21wcl93cml0dGVuX2Jsb2NrIGFuZCBj
b21wcl9zYXZlZF9ibG9jayB0byAiMCIuCj4gPiArCj4gPiArV2hhdDogICAgICAgICAgICAgICAg
L3N5cy9mcy9mMmZzLzxkaXNrPi9jb21wcl9zYXZlZF9ibG9jawo+ID4gK0RhdGU6ICAgICAgICAg
ICAgICAgIE1hcmNoIDIwMjEKPiA+ICtDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+ID4gK0Rlc2NyaXB0aW9uOiBTaG93IHRoZSBzYXZlZCBibG9jayBj
b3VudCB3aXRoIGNvbXByZXNzaW9uIHNpbmNlIG1vdW50LiBOb3RlCj4gPiArICAgICAgICAgICAg
IHRoYXQgd2hlbiB0aGUgY29tcHJlc3NlZCBibG9ja3MgYXJlIGRlbGV0ZWQsIHRoaXMgY291bnQg
ZG9lc24ndAo+ID4gKyAgICAgICAgICAgICBkZWNyZWFzZS4gSWYgeW91IHdyaXRlICIwIiBoZXJl
LCB5b3UgY2FuIGluaXRpYWxpemUKPiA+ICsgICAgICAgICAgICAgY29tcHJfd3JpdHRlbl9ibG9j
ayBhbmQgY29tcHJfc2F2ZWRfYmxvY2sgdG8gIjAiLgo+ID4gKwo+ID4gK1doYXQ6ICAgICAgICAg
ICAgICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vY29tcHJfbmV3X2lub2RlCj4gPiArRGF0ZTogICAg
ICAgICAgICAgICAgTWFyY2ggMjAyMQo+ID4gK0NvbnRhY3Q6ICAgICAiRGFlaG8gSmVvbmciIDxk
YWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiArRGVzY3JpcHRpb246IFNob3cgdGhlIGNvdW50IG9m
IGlub2RlIG5ld2x5IGVuYWJsZWQgZm9yIGNvbXByZXNzaW9uIHNpbmNlIG1vdW50Lgo+ID4gKyAg
ICAgICAgICAgICBOb3RlIHRoYXQgd2hlbiB0aGUgY29tcHJlc3Npb24gaXMgZGlzYWJsZWQgZm9y
IHRoZSBmaWxlcywgdGhpcyBjb3VudAo+ID4gKyAgICAgICAgICAgICBkb2Vzbid0IGRlY3JlYXNl
LiBJZiB5b3Ugd3JpdGUgIjAiIGhlcmUsIHlvdSBjYW4gaW5pdGlhbGl6ZQo+ID4gKyAgICAgICAg
ICAgICBjb21wcl9uZXdfaW5vZGUgdG8gIjAiLgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29t
cHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gaW5kZXggNzdmYTM0MmRlMzhmLi4zYzlk
Nzk3ZGJkZDYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPiA+ICsrKyBiL2Zz
L2YyZnMvY29tcHJlc3MuYwo+ID4gQEAgLTEzNTMsNiArMTM1Myw3IEBAIHN0YXRpYyBpbnQgZjJm
c193cml0ZV9jb21wcmVzc2VkX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+ID4gICAg
ICAgaWYgKGZpby5jb21wcl9ibG9ja3MpCj4gPiAgICAgICAgICAgICAgIGYyZnNfaV9jb21wcl9i
bG9ja3NfdXBkYXRlKGlub2RlLCBmaW8uY29tcHJfYmxvY2tzIC0gMSwgZmFsc2UpOwo+ID4gICAg
ICAgZjJmc19pX2NvbXByX2Jsb2Nrc191cGRhdGUoaW5vZGUsIGNjLT5ucl9jcGFnZXMsIHRydWUp
Owo+ID4gKyAgICAgYWRkX2NvbXByX2Jsb2NrX3N0YXQoaW5vZGUsIGNjLT5ucl9jcGFnZXMpOwo+
ID4KPiA+ICAgICAgIHNldF9pbm9kZV9mbGFnKGNjLT5pbm9kZSwgRklfQVBQRU5EX1dSSVRFKTsK
PiA+ICAgICAgIGlmIChjYy0+Y2x1c3Rlcl9pZHggPT0gMCkKPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCBlMmQzMDJhZTNhNDYuLjJjOTg5
ZjhjYWYwNSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZz
L2YyZnMuaAo+ID4gQEAgLTE2MjMsNiArMTYyMywxMSBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsK
PiA+ICAjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04KPiA+ICAgICAgIHN0cnVjdCBr
bWVtX2NhY2hlICpwYWdlX2FycmF5X3NsYWI7ICAgICAvKiBwYWdlIGFycmF5IGVudHJ5ICovCj4g
PiAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9hcnJheV9zbGFiX3NpemU7ICAgICAgLyogZGVmYXVs
dCBwYWdlIGFycmF5IHNsYWIgc2l6ZSAqLwo+ID4gKwo+ID4gKyAgICAgLyogRm9yIHJ1bnRpbWUg
Y29tcHJlc3Npb24gc3RhdGlzdGljcyAqLwo+ID4gKyAgICAgYXRvbWljNjRfdCBjb21wcl93cml0
dGVuX2Jsb2NrOwo+ID4gKyAgICAgYXRvbWljNjRfdCBjb21wcl9zYXZlZF9ibG9jazsKPiA+ICsg
ICAgIGF0b21pY190IGNvbXByX25ld19pbm9kZTsKPgo+IFdoeSBkbyB5b3UgbmVlZCB0aGVzZSB0
byBiZSBhdG9taWM/ICBXaGF0IHJlcXVpcmVzIHRoaXM/Cj4KPiA+ICsjaWZkZWYgQ09ORklHX0Yy
RlNfRlNfQ09NUFJFU1NJT04KPiA+ICsgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgImNv
bXByX3dyaXR0ZW5fYmxvY2siKSkgewo+ID4gKyAgICAgICAgICAgICB1NjQgYmNvdW50Owo+ID4g
KyAgICAgICAgICAgICBpbnQgbGVuOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBiY291bnQgPSBh
dG9taWM2NF9yZWFkKCZzYmktPmNvbXByX3dyaXR0ZW5fYmxvY2spOwo+ID4gKwo+ID4gKyAgICAg
ICAgICAgICBsZW4gPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlbGx1XG4iLCBiY291bnQp
Owo+Cj4gUGxlYXNlIHVzZSBzeXNmc19lbWl0KCkgZm9yIG5ldyBzeXNmcyBlbnRyaWVzIGxpa2Ug
dGhlc2UuICBNYWtlcyBpdCBtdWNoCj4gc2ltcGxlci4KPgo+IEFuZCBsb29rLCB5b3UgcmVhbGx5
IGRvIG5vdCBuZWVkIGFuIGF0b21pYyB2YWx1ZSBhcyB0aGlzIGlzIGp1c3QgYQo+IHJhbmRvbSBu
dW1iZXIgeW91IGFyZSBzZW5kaW5nIHRvIHVzZXJzcGFjZSB0aGF0IGNvdWxkIGJlIHN0YWxlIHRo
ZQo+IG1pbnV0ZSB5b3UgcmVhZCBmcm9tIGl0Lgo+Cj4gUGxlYXNlIGp1c3QgdXNlIGEgbm9ybWFs
IHU2NCBhbmQgc2F2ZSB0aGUgY3B1IHN5bmMgZm9yIHN0dWZmIGxpa2UgdGhpcy4KPgo+IHRoYW5r
cywKPgo+IGdyZWcgay1oCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
