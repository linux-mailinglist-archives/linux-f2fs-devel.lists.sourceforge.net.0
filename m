Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E72F8A22
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Jan 2021 02:00:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0ZxE-0007Fk-JU; Sat, 16 Jan 2021 01:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l0ZxC-0007FQ-JE
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Jan 2021 01:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v2CT9ktuVNHesPpg5xBPxclzRFEcw4HruqKUslhD9m4=; b=GOkkqZYX4NWwrwb5HGEg7C5y1o
 H1CQDRCywaO1nAU2l9qghdrqjlDpeNlaDOq7/ZMGojrXpHdo1DZ4Tn6MskgyHjrfVY8a4nUZWyhym
 h1bHOOYzvL9r7Q0iiF4SMlg5OntueRkj2LLW+pl0ldS6FFxMpnX6nzGpWmjjTxVPiqVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v2CT9ktuVNHesPpg5xBPxclzRFEcw4HruqKUslhD9m4=; b=CIQbnVqVCAIxqMZdznLn6jIHya
 csOP21rJ1GGYj+X0/cUEsdbldKatv/icxf2WhsIe5v6lPVT4rr5QipBd3xTiIskg8pa1JyawtHehs
 A+MA9J8BcPHJWyOxqxI0aqVjmj5fUby+DODh84xOW0ffwC+Kw76JJHMRlms96UeUVHgQ=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l0Zx7-00H9db-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 16 Jan 2021 01:00:34 +0000
Received: by mail-lf1-f50.google.com with SMTP id a12so15851335lfl.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Jan 2021 17:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2CT9ktuVNHesPpg5xBPxclzRFEcw4HruqKUslhD9m4=;
 b=QiuPYUo7vUrRxc/EN0esFuL5w10VlWd9caRvCbLA/d/X6LYZROsdT4vbaHT6nrnFLM
 1xN5+VErX6Tg1O8b0AClnWDYk0M2nAUFGSraM415zm1GbXJAtg5ephFHbZRjvM/NzQnU
 GyE0bZB5Q3l1HLl10vDab7iTnQnc27YZ2gfQ9rpk7letMaFTBgQrKBIUHG02lqbMp3nk
 1h4S5mdl0AgdSexkWflLQV3fGvs5MkFkpyQx2lVzTVPpdN2fclHPegLtiimhi2opsN12
 8t9Y3fP1kddvaB18+MxGcIP8SUnbwvLlhwt3TBR0U6K/uIUKU+fAzUFtu8KItK8wxie4
 dYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2CT9ktuVNHesPpg5xBPxclzRFEcw4HruqKUslhD9m4=;
 b=oP52JbV8cWZ+YC08sET64UweWa6MYG0YbkICqlpSiq/tns5Y6nxLOrj00xdY8x3cAY
 J5gk1EhsSAh8O8wXQ1neCUU7fj03fvN8g95PoeeZOXksgcJB1yu4w8ZgRZYHPFc9rvLv
 V/7MBBdk7boDdjNpYMe1HS8xpEJvk5U12LljJRp/pj6eVgy6xSr98OgFgupQsiqrAF+N
 ji30ymDbZCDQ0d5CwJrZk9ZIAD04DUvFigFlBhSfse/1GhDEu/QD8UkQfzSh9EQCsLX9
 ujuegg9aP6P8wmuWYtc/D8XMzULwH6Lk0IQ315mjoJ5eB/nF8m/6fsHQO0r5XLWIFfYO
 eOjA==
X-Gm-Message-State: AOAM533mjExrTBc3LdCUJGwJOSbjt1YBLDM4oLtmny+bjljWm84LjxTm
 TVMvyPaSugxHNB/XkMVhApGH4+lVE6nd0Zf/JMo=
X-Google-Smtp-Source: ABdhPJyXU+xINJRHQ1dG/X4hLKR7tzjwGClRsWb3mLvwpDcxFLVVD0NSI+tQHhMbaGiT/KR16qb84celHQW+hdkxVAk=
X-Received: by 2002:a19:7507:: with SMTP id y7mr5077158lfe.554.1610758823120; 
 Fri, 15 Jan 2021 17:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20210116005812.3753714-1-daeho43@gmail.com>
In-Reply-To: <20210116005812.3753714-1-daeho43@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 16 Jan 2021 10:00:12 +0900
Message-ID: <CACOAw_w22xp9Z9uHCPgY2zEmAMZ6kfmQAjhEORBEGoyLccDPqw@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 kernel-team@android.com
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l0Zx7-00H9db-Qv
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add ckpt_thread_ioprio sysfs node
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U29ycnksIGlnbm9yZSB0aGlzLgpJJ3ZlIHNlbnQgdGhpcyB3cm9uZy4gOigKCjIwMjHrhYQgMeyb
lCAxNuydvCAo7YagKSDsmKTsoIQgOTo1OCwgRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29t
PuuLmOydtCDsnpHshLE6Cj4KPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUu
Y29tPgo+Cj4gQWRkZWQgImNrcHRfdGhyZWFkX2lvcHJpbyIgc3lzZnMgbm9kZSB0byBnaXZlIGEg
d2F5IHRvIGNoYW5nZSBjaGVja3BvaW50Cj4gbWVyZ2UgZGFlbW9uJ3MgaW8gcHJpb3JpdHkuIEl0
cyBkZWZhdWx0IHZhbHVlIGlzICJiZSwzIiwgd2hpY2ggbWVhbnMKPiAiQkUiIEkvTyBjbGFzcyBh
bmQgSS9PIHByaW9yaXR5ICIzIi4gV2UgY2FuIHNlbGVjdCB0aGUgY2xhc3MgYmV0d2VlbiAicnQi
Cj4gYW5kICJiZSIsIGFuZCBzZXQgdGhlIEkvTyBwcmlvcml0eSB3aXRoaW4gdmFsaWQgcmFuZ2Ug
b2YgaXQuCj4gIiwiIGRlbGltaXRlciBpcyBuZWNlc3NhcnkgaW4gYmV0d2VlbiBJL08gY2xhc3Mg
YW5kIHByaW9yaXR5IG51bWJlci4KPgo+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVo
b2plb25nQGdvb2dsZS5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBhZGFwdCB0byBpbmxpbmluZyBja3B0
X3JlcV9jb250cm9sIG9mIGYyZnNfc2JfaW5mbwo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCAgOCArKysrCj4gIGZzL2YyZnMvY2hlY2twb2ludC5jICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGZzL2YyZnMvZjJmcy5oICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKPiAgZnMvZjJmcy9zeXNmcy5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDYx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5n
L3N5c2ZzLWZzLWYyZnMKPiBpbmRleCAzZGZlZTk0ZTA2MTguLjBjNDhiMmU3ZGZkNCAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiArKysgYi9E
b2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiBAQCAtMzc3LDMgKzM3Nywx
MSBAQCBEZXNjcmlwdGlvbjogICAgICAgVGhpcyBnaXZlcyBhIGNvbnRyb2wgdG8gbGltaXQgdGhl
IGJpbyBzaXplIGluIGYyZnMuCj4gICAgICAgICAgICAgICAgIERlZmF1bHQgaXMgemVybywgd2hp
Y2ggd2lsbCBmb2xsb3cgdW5kZXJseWluZyBibG9jayBsYXllciBsaW1pdCwKPiAgICAgICAgICAg
ICAgICAgd2hlcmVhcywgaWYgaXQgaGFzIGEgY2VydGFpbiBieXRlcyB2YWx1ZSwgZjJmcyB3b24n
dCBzdWJtaXQgYQo+ICAgICAgICAgICAgICAgICBiaW8gbGFyZ2VyIHRoYW4gdGhhdCBzaXplLgo+
ICtXaGF0OiAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2NrcHRfdGhyZWFkX2lvcHJpbwo+
ICtEYXRlOiAgICAgICAgICBKYW51YXJ5IDIwMjEKPiArQ29udGFjdDogICAgICAgIkRhZWhvIEpl
b25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ICtEZXNjcmlwdGlvbjogICBHaXZlIGEgd2F5
IHRvIGNoYW5nZSBjaGVja3BvaW50IG1lcmdlIGRhZW1vbidzIGlvIHByaW9yaXR5Lgo+ICsgICAg
ICAgICAgICAgICBJdHMgZGVmYXVsdCB2YWx1ZSBpcyAiYmUsMyIsIHdoaWNoIG1lYW5zICJCRSIg
SS9PIGNsYXNzIGFuZAo+ICsgICAgICAgICAgICAgICBJL08gcHJpb3JpdHkgIjMiLiBXZSBjYW4g
c2VsZWN0IHRoZSBjbGFzcyBiZXR3ZWVuICJydCIgYW5kICJiZSIsCj4gKyAgICAgICAgICAgICAg
IGFuZCBzZXQgdGhlIEkvTyBwcmlvcml0eSB3aXRoaW4gdmFsaWQgcmFuZ2Ugb2YgaXQuICIsIiBk
ZWxpbWl0ZXIKPiArICAgICAgICAgICAgICAgaXMgbmVjZXNzYXJ5IGluIGJldHdlZW4gSS9PIGNs
YXNzIGFuZCBwcmlvcml0eSBudW1iZXIuCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2twb2lu
dC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiBpbmRleCBlZjZhZDNkMTk1N2QuLjMwZTNmZTE2
MWJiNCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ICsrKyBiL2ZzL2YyZnMv
Y2hlY2twb2ludC5jCj4gQEAgLTE4NTQsNyArMTg1NCw3IEBAIGludCBmMmZzX3N0YXJ0X2NrcHRf
dGhyZWFkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoY3ByYy0+ZjJmc19pc3N1ZV9ja3B0KTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAg
c2V0X3Rhc2tfaW9wcmlvKGNwcmMtPmYyZnNfaXNzdWVfY2twdCwgREVGQVVMVF9DSEVDS1BPSU5U
X0lPUFJJTyk7Cj4gKyAgICAgICBzZXRfdGFza19pb3ByaW8oY3ByYy0+ZjJmc19pc3N1ZV9ja3B0
LCBjcHJjLT5ja3B0X3RocmVhZF9pb3ByaW8pOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gaW5kZXggZjJh
ZTA3NWFhNzIzLi41MTdlYjBlZGE2MzggMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiAr
KysgYi9mcy9mMmZzL2YyZnMuaAo+IEBAIC0yNzYsNiArMjc2LDcgQEAgc3RydWN0IGNrcHRfcmVx
IHsKPgo+ICBzdHJ1Y3QgY2twdF9yZXFfY29udHJvbCB7Cj4gICAgICAgICBzdHJ1Y3QgdGFza19z
dHJ1Y3QgKmYyZnNfaXNzdWVfY2twdDsgICAgLyogY2hlY2twb2ludCB0YXNrICovCj4gKyAgICAg
ICBpbnQgY2twdF90aHJlYWRfaW9wcmlvOyAgICAgICAgICAgICAgICAgLyogY2hlY2twb2ludCBt
ZXJnZSB0aHJlYWQgaW9wcmlvICovCj4gICAgICAgICB3YWl0X3F1ZXVlX2hlYWRfdCBja3B0X3dh
aXRfcXVldWU7ICAgICAgLyogd2FpdGluZyBxdWV1ZSBmb3Igd2FrZS11cCAqLwo+ICAgICAgICAg
YXRvbWljX3QgaXNzdWVkX2NrcHQ7ICAgICAgICAgICAvKiAjIG9mIGFjdHVhbGx5IGlzc3VlZCBj
a3B0cyAqLwo+ICAgICAgICAgYXRvbWljX3QgdG90YWxfY2twdDsgICAgICAgICAgICAvKiAjIG9m
IHRvdGFsIGNrcHRzICovCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMv
c3lzZnMuYwo+IGluZGV4IDMwYmFlNTc0MjhkMS4uZGRkNzAzOTUxNDhkIDEwMDY0NAo+IC0tLSBh
L2ZzL2YyZnMvc3lzZnMuYwo+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+IEBAIC0xMSw2ICsxMSw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9mMmZzX2ZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zZXFf
ZmlsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvdW5pY29kZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
aW9wcmlvLmg+Cj4KPiAgI2luY2x1ZGUgImYyZnMuaCIKPiAgI2luY2x1ZGUgInNlZ21lbnQuaCIK
PiBAQCAtMzQsNiArMzUsNyBAQCBlbnVtIHsKPiAgICAgICAgIEZBVUxUX0lORk9fVFlQRSwgICAg
ICAgIC8qIHN0cnVjdCBmMmZzX2ZhdWx0X2luZm8gKi8KPiAgI2VuZGlmCj4gICAgICAgICBSRVNF
UlZFRF9CTE9DS1MsICAgICAgICAvKiBzdHJ1Y3QgZjJmc19zYl9pbmZvICovCj4gKyAgICAgICBD
UFJDX0lORk8sICAgICAgLyogc3RydWN0IGNrcHRfcmVxX2NvbnRyb2wgKi8KPiAgfTsKPgo+ICBz
dHJ1Y3QgZjJmc19hdHRyIHsKPiBAQCAtNzAsNiArNzIsOCBAQCBzdGF0aWMgdW5zaWduZWQgY2hh
ciAqX19zdHJ1Y3RfcHRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHN0cnVjdF90eXBl
KQo+ICAgICAgICAgZWxzZSBpZiAoc3RydWN0X3R5cGUgPT0gU1RBVF9JTkZPKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gKHVuc2lnbmVkIGNoYXIgKilGMkZTX1NUQVQoc2JpKTsKPiAgI2VuZGlm
Cj4gKyAgICAgICBlbHNlIGlmIChzdHJ1Y3RfdHlwZSA9PSBDUFJDX0lORk8pCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAodW5zaWduZWQgY2hhciAqKSZzYmktPmNwcmNfaW5mbzsKPiAgICAgICAg
IHJldHVybiBOVUxMOwo+ICB9Cj4KPiBAQCAtMjU1LDYgKzI1OSwyMyBAQCBzdGF0aWMgc3NpemVf
dCBmMmZzX3NiaV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBsZW47Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFt
ZSwgImNrcHRfdGhyZWFkX2lvcHJpbyIpKSB7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBja3B0
X3JlcV9jb250cm9sICpjcHJjID0gJnNiaS0+Y3ByY19pbmZvOwo+ICsgICAgICAgICAgICAgICBp
bnQgbGVuID0gMDsKPiArICAgICAgICAgICAgICAgaW50IGNsYXNzID0gSU9QUklPX1BSSU9fQ0xB
U1MoY3ByYy0+Y2twdF90aHJlYWRfaW9wcmlvKTsKPiArICAgICAgICAgICAgICAgaW50IGRhdGEg
PSBJT1BSSU9fUFJJT19EQVRBKGNwcmMtPmNrcHRfdGhyZWFkX2lvcHJpbyk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICBpZiAoY2xhc3MgPT0gSU9QUklPX0NMQVNTX1JUKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGxlbiArPSBzY25wcmludGYoYnVmICsgbGVuLCBQQUdFX1NJWkUgLSBsZW4sICJy
dCwiKTsKPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoY2xhc3MgPT0gSU9QUklPX0NMQVNTX0JF
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxlbiArPSBzY25wcmludGYoYnVmICsgbGVuLCBQ
QUdFX1NJWkUgLSBsZW4sICJiZSwiKTsKPiArICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiArICAgICAgICAgICAgICAgbGVu
ICs9IHNjbnByaW50ZihidWYgKyBsZW4sIFBBR0VfU0laRSAtIGxlbiwgIiVkXG4iLCBkYXRhKTsK
PiArICAgICAgICAgICAgICAgcmV0dXJuIGxlbjsKPiArICAgICAgIH0KPiArCj4gICAgICAgICB1
aSA9ICh1bnNpZ25lZCBpbnQgKikocHRyICsgYS0+b2Zmc2V0KTsKPgo+ICAgICAgICAgcmV0dXJu
IHNwcmludGYoYnVmLCAiJXVcbiIsICp1aSk7Cj4gQEAgLTMwOCw2ICszMjksMzQgQEAgc3RhdGlj
IHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYyZnNfYXR0ciAqYSwKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldCA/IHJldCA6IGNvdW50Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAo
IXN0cmNtcChhLT5hdHRyLm5hbWUsICJja3B0X3RocmVhZF9pb3ByaW8iKSkgewo+ICsgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gc3RyaW0oKGNoYXIgKilidWYpOwo+ICsgICAgICAg
ICAgICAgICBzdHJ1Y3QgY2twdF9yZXFfY29udHJvbCAqY3ByYyA9ICZzYmktPmNwcmNfaW5mbzsK
PiArICAgICAgICAgICAgICAgaW50IGNsYXNzOwo+ICsgICAgICAgICAgICAgICBsb25nIGRhdGE7
Cj4gKyAgICAgICAgICAgICAgIGludCByZXQ7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIXN0
cm5jbXAobmFtZSwgInJ0LCIsIDMpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsYXNzID0g
SU9QUklPX0NMQVNTX1JUOwo+ICsgICAgICAgICAgICAgICBlbHNlIGlmICghc3RybmNtcChuYW1l
LCAiYmUsIiwgMykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xhc3MgPSBJT1BSSU9fQ0xB
U1NfQkU7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICAgICAgICAgIG5hbWUgKz0gMzsKPiArICAgICAg
ICAgICAgICAgcmV0ID0ga3N0cnRvbChuYW1lLCAxMCwgJmRhdGEpOwo+ICsgICAgICAgICAgICAg
ICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAg
ICAgICAgICAgIGlmIChkYXRhID49IElPUFJJT19CRV9OUiB8fCBkYXRhIDwgMCkKPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICAgICAgICAgIGNw
cmMtPmNrcHRfdGhyZWFkX2lvcHJpbyA9IElPUFJJT19QUklPX1ZBTFVFKGNsYXNzLCBkYXRhKTsK
PiArICAgICAgICAgICAgICAgcmV0ID0gc2V0X3Rhc2tfaW9wcmlvKGNwcmMtPmYyZnNfaXNzdWVf
Y2twdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwcmMtPmNrcHRfdGhyZWFk
X2lvcHJpbyk7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gKyAgICAgICB9
Cj4gKwo+ICAgICAgICAgdWkgPSAodW5zaWduZWQgaW50ICopKHB0ciArIGEtPm9mZnNldCk7Cj4K
PiAgICAgICAgIHJldCA9IGtzdHJ0b3VsKHNraXBfc3BhY2VzKGJ1ZiksIDAsICZ0KTsKPiBAQCAt
NTY3LDYgKzYxNiw3IEBAIEYyRlNfUldfQVRUUihGQVVMVF9JTkZPX1RZUEUsIGYyZnNfZmF1bHRf
aW5mbywgaW5qZWN0X3R5cGUsIGluamVjdF90eXBlKTsKPiAgI2VuZGlmCj4gIEYyRlNfUldfQVRU
UihGMkZTX1NCSSwgZjJmc19zYl9pbmZvLCBkYXRhX2lvX2ZsYWcsIGRhdGFfaW9fZmxhZyk7Cj4g
IEYyRlNfUldfQVRUUihGMkZTX1NCSSwgZjJmc19zYl9pbmZvLCBub2RlX2lvX2ZsYWcsIG5vZGVf
aW9fZmxhZyk7Cj4gK0YyRlNfUldfQVRUUihDUFJDX0lORk8sIGNrcHRfcmVxX2NvbnRyb2wsIGNr
cHRfdGhyZWFkX2lvcHJpbywgY2twdF90aHJlYWRfaW9wcmlvKTsKPiAgRjJGU19HRU5FUkFMX1JP
X0FUVFIoZGlydHlfc2VnbWVudHMpOwo+ICBGMkZTX0dFTkVSQUxfUk9fQVRUUihmcmVlX3NlZ21l
bnRzKTsKPiAgRjJGU19HRU5FUkFMX1JPX0FUVFIobGlmZXRpbWVfd3JpdGVfa2J5dGVzKTsKPiBA
QCAtNjUyLDYgKzcwMiw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10g
PSB7Cj4gICNlbmRpZgo+ICAgICAgICAgQVRUUl9MSVNUKGRhdGFfaW9fZmxhZyksCj4gICAgICAg
ICBBVFRSX0xJU1Qobm9kZV9pb19mbGFnKSwKPiArICAgICAgIEFUVFJfTElTVChja3B0X3RocmVh
ZF9pb3ByaW8pLAo+ICAgICAgICAgQVRUUl9MSVNUKGRpcnR5X3NlZ21lbnRzKSwKPiAgICAgICAg
IEFUVFJfTElTVChmcmVlX3NlZ21lbnRzKSwKPiAgICAgICAgIEFUVFJfTElTVCh1bnVzYWJsZSks
Cj4gLS0KPiAyLjMwLjAuMjk2LmcyYmZiMWM0NmQ4LWdvb2cKPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
