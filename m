Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181688D18
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Aug 2019 21:53:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwXR5-0004W7-SY; Sat, 10 Aug 2019 19:53:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hwXR5-0004W1-7y
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Aug 2019 19:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WHZ0iMjd+y5AxcpJPPv9/Si0IhWcZrpj60zl/nubnc=; b=jLsYcfJmDRcbL3G5wIs61/d1FH
 /qQNrHRSXW1npSaojapf4X/+hxME6cxTsTbJuaReqxqBpnGToKp+IbSeSkfLsXTPhcfErPizaJfXJ
 wXRoG7EzpDQ7XNeI/8MglZeNRxQw6Tz621YdNkMQN7h64tGz+PmbWl7qgXyI06hDtSHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7WHZ0iMjd+y5AxcpJPPv9/Si0IhWcZrpj60zl/nubnc=; b=DWkW8suGscH0l9g/CD8isTc0Bd
 SGRX+VydXtxGvOqvENmiW/5WiKah3OMDKRhf2hO2IwSimsqa554CTw1irvzJ2Fp4zxZxWjGA4tPRJ
 ygiz0n7mKSHHM+VLeWhQ75FxY2o3tnvRyMGwKPJ2EL6CDfaRuIauq9m7fIe4V7TL2Cfg=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hwXR3-000zyW-Ul
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Aug 2019 19:53:55 +0000
Received: by mail-vs1-f68.google.com with SMTP id r3so67589784vsr.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 10 Aug 2019 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7WHZ0iMjd+y5AxcpJPPv9/Si0IhWcZrpj60zl/nubnc=;
 b=JwYjtk9Er6QiAGFKksCHmtjgunBpUCUyEpSEhT97xuJsGUpeGEXerinV3lutAkJ6GW
 vwEhaVRZ3qcWU35DlOtK7jM58biKlDAhJwwAAbMwFqLFSVcz/T0JcbZIW0aYE4QoXlgU
 T0THitnvvZIwMDIVmTGE218t0xpU40oiL8JCPiIUbZgQyDXDEmbPRne3qyCB+2cF81l6
 yxT/bsCTjllYmZ/dljdF3tkf6tmL2eKb9PIz6WlunUUy1UF+02VdOImort+wc+mQmNDs
 CV9JbhEdjm/7RdoPHN5mtZUIAVwJcrtRdPIqsdmAX2rCwD88GnQp8MzmZ+FUWHbbChJk
 Fpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7WHZ0iMjd+y5AxcpJPPv9/Si0IhWcZrpj60zl/nubnc=;
 b=qNwNeB44BoD4IZH6F9HVtX42Z0B0ys1MIpaytHzyudx6kLihZcYHQX5rNyALulivy8
 LOvsM44NZAudGVk3LOXtpsiZrgjhy20vxCkzcupj35N0LHQAbCFMOaoKsa3CGUwCWGm/
 aI4kFtDWbSPswwcxqpyWB2k+h46Qa/950p9P0wTiHyi0xqx5D4D6+9ROFGnmevw9rCD3
 6n1bHvjqdJ6Mt9gSteLhb++hiiCf80h36QhMpqdqP7cmmmLvKwHzQp4biBWz0iK3+Oez
 LONpxmFBv3s4Wf5l+P3XjW+AGYsVSnlcquV7dN1Z4eHazObQ7gLJVPLL87yzFtVpvLrg
 /hiA==
X-Gm-Message-State: APjAAAVbDnlNE5No0LPoqXECixp/X2AW5m5eyNhs9RBUyv9DUPLlf4YH
 pQFl+9J2XQafqtimokswrueC1EMry7zF1aVZp4A=
X-Google-Smtp-Source: APXvYqzrHeuOxmth4tU/7yLbE618cFdFWZToMJadZdpNsejf89DvMaLfvT/XK8esuOZbHBUY3RkcHJP+nWyL+ihQWJ8=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr17584811vsc.85.1565466827820; 
 Sat, 10 Aug 2019 12:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190711012915.5581-1-yuchao0@huawei.com>
In-Reply-To: <20190711012915.5581-1-yuchao0@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Sun, 11 Aug 2019 04:53:37 +0900
Message-ID: <CAD14+f3fiY8m7f91-ohHUj8ThMeYF7+Q=DU8c2c_8PTis8t-mw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hwXR3-000zyW-Ul
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: improve print log in
 f2fs_sanity_check_ckpt()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFlZ2V1aywKCkkgdGhpbmsgd2UnbGwgYWxsIGFwcHJlY2lhdGUgaWYgdjEuMTMuMCBnZXRz
IHRhZ2dlZCA6KQpJIGJlbGlldmUgdGhlIGN1cnJlbnQgZGV2IGJyYW5jaCBoYXMgYmVlbiBpbiBn
b29kIHNoYXBlIGZvciBxdWl0ZSBzb21lIHRpbWUgbm93LgoKVGhhbmtzLgoKCjIwMTnrhYQgN+yb
lCAxMeydvCAo66qpKSDsmKTsoIQgMTA6MzEsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7r
i5jsnbQg7J6R7ISxOgo+Cj4gQXMgUGFyayBKdSBIeXVuZyBzdWdnZXN0ZWQ6Cj4KPiAiSSdkIGxp
a2UgdG8gc3VnZ2VzdCB0byB3cml0ZSBkb3duIGFuIGFjdHVhbCB2ZXJzaW9uIG9mIGYyZnMtdG9v
bHMKPiBoZXJlIGFzIHdlJ3ZlIHNlZW4gb2xkZXIgdmVyc2lvbnMgb2YgZnNjayBkb2luZyBldmVu
IG1vcmUgZGFtYWdlCj4gYW5kIHRoZSB1c2VycyBtaWdodCBub3QgaGF2ZSB0aGUgbGF0ZXN0IGYy
ZnMtdG9vbHMgaW5zdGFsbGVkLiIKPgo+IFRoaXMgcGF0Y2ggZ2l2ZSBhIG1vcmUgZGV0YWlsZWQg
aW5mbyBvZiBob3cgd2UgZml4IHN1Y2ggY29ycnVwdGlvbgo+IHRvIHVzZXIgdG8gYXZvaWQgZGFt
YWdlYWJsZSByZXBhaXIgd2l0aCBsb3cgdmVyc2lvbiBmc2NrLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGFyayBKdSBIeXVuZyA8cWtyd25ndWQ4MjVAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MjoKPiAtIGFkZCBmaXhpbmcgcGF0
Y2gncyB0aXRsZSBpbiBsb2cgc3VnZ2VzdGVkIGJ5IEphZWdldWsuCj4gIGZzL2YyZnMvc3VwZXIu
YyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4g
aW5kZXggMWE2ZDgyZDU1OGU0Li40N2RhZTdjM2FlNGYgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9z
dXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTI2OTYsNyArMjY5Niw5IEBAIGlu
dCBmMmZzX3Nhbml0eV9jaGVja19ja3B0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPgo+ICAg
ICAgICAgaWYgKF9faXNfc2V0X2NrcHRfZmxhZ3MoY2twdCwgQ1BfTEFSR0VfTkFUX0JJVE1BUF9G
TEFHKSAmJgo+ICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShja3B0LT5jaGVja3N1bV9vZmZz
ZXQpICE9IENQX01JTl9DSEtTVU1fT0ZGU0VUKSB7Cj4gLSAgICAgICAgICAgICAgIGYyZnNfd2Fy
bihzYmksICJsYXlvdXQgb2YgbGFyZ2VfbmF0X2JpdG1hcCBpcyBkZXByZWNhdGVkLCBydW4gZnNj
ayB0byByZXBhaXIsIGNoa3N1bV9vZmZzZXQ6ICV1IiwKPiArICAgICAgICAgICAgICAgZjJmc193
YXJuKHNiaSwgInVzaW5nIGRlcHJlY2F0ZWQgbGF5b3V0IG9mIGxhcmdlX25hdF9iaXRtYXAsICIK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICJwbGVhc2UgcnVuIGZzY2sgdjEuMTMuMCBvciBo
aWdoZXIgdG8gcmVwYWlyLCBjaGtzdW1fb2Zmc2V0OiAldSwgIgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgImZpeGVkIHdpdGggcGF0Y2g6IFwiZjJmcy10b29sczogcmVsb2NhdGUgY2hrc3Vt
X29mZnNldCBmb3IgbGFyZ2VfbmF0X2JpdG1hcCBmZWF0dXJlXCIiLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGUzMl90b19jcHUoY2twdC0+Y2hlY2tzdW1fb2Zmc2V0KSk7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiAxOwo+ICAgICAgICAgfQo+IC0tCj4gMi4xOC4wLnJjMQo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
