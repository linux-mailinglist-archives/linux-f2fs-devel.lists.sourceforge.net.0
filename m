Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9D339A37
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Mar 2021 01:00:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKrhs-0006Zt-71; Sat, 13 Mar 2021 00:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lKrhq-0006Zb-QQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Mar 2021 00:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gmxyat8Pn6hyY6rb0+pkI0hzaawVQ4oGi5yLjm26k8Y=; b=XninjdccSBWjtuQOkIXfsN8DnA
 VpZCHo2opzlz7rqinXZxsaa4BuhYrGt0Y/AKahqjHaqyOni6OPEnG7iNAFdPQoBzaCEH51TdwQZM9
 1OZOd9jsSR66ELJoM0G0rhR9sapPLLxjCVrZ5v+K5Lya6vv8rJf4yVYjJ6bL/rrqDpYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gmxyat8Pn6hyY6rb0+pkI0hzaawVQ4oGi5yLjm26k8Y=; b=BXpdugL0ODWMuoohxla7hrx7c7
 2B59iUikzLbrxo5LdNpaFLkphOyGqDP/InZ6eWQ78dvaRU1VC91Jl0AyCvmVqwEYMg9uFIsh4Msvs
 RB2YP4btkLYBFRJ3bJgDVFyqdDmOvy+ZncnVt6onN7DYLKNFB7jvmsWyQ+5Z7YK60nQs=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lKrhm-007eiW-2C
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Mar 2021 00:00:34 +0000
Received: by mail-lf1-f49.google.com with SMTP id e7so48055264lft.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Mar 2021 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gmxyat8Pn6hyY6rb0+pkI0hzaawVQ4oGi5yLjm26k8Y=;
 b=UTj96buQ3XHBWUSJXpY2KO2W7ziKfVt5FGyxJSmGF7qNh5cO0Gs7fF301zupMIgh53
 oLsI5kHp9A81jOaitaEqd5DxC2VzGYLa46zZPy1rMZ8LxJLfCNMzQTJ4ajhFz4f++C/Z
 K+ZdoULYaPUvUCfHz661H18eFsR9zo93zJXhMzb6uYeaEAsfaVn+TwjlAfmX/AJL8h2U
 0IeCHBFStENhHzzDJUR+esKbWkPc1EO82x+jAbuVQ0T12sCdQO2f/bOp1gHDb9q/gdiW
 x+7S0q43wFWCB4MyG48CSc4Dk874O1j2/PH1R2vPhlq+VRiUm3AjARFSrfOQFTQTudse
 YY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gmxyat8Pn6hyY6rb0+pkI0hzaawVQ4oGi5yLjm26k8Y=;
 b=q7zF2wXypmbUSIVf7iwtuSQkLUo3lJI5N6e9SFK4bgEEIAptiCPi6tOQdE0zEnBSa3
 2mEpUXjmMn+FKiL2Egc9mUfcrh+rcTi1AyKP05x3d71uKvanMa5FyzKj9JfQ3JjoR6Nx
 Y6ogpY3JlH1kjGoxRLKLXkp4fiBCVIyRYdINBxWtr+59k9ov1Nr4VQqhjmS/Ei4So7cD
 yqKmsXWmi0jLbGSThRIs8cVHj17wgxEUr/qWu0tKtgZd3dQlvbLYZN0upj0JDLiZOqwv
 ryrTCvS4fwiybf6zqdb9qh9iDEKWsOB0asXNGx2oztjS0SOmJUrShh1ADQ9FS8a62Z/C
 uDlA==
X-Gm-Message-State: AOAM5306bb7Jci5Ed6lReGwo06fU0qJgyKB8dNOEXitZbR+wOHVLYaWe
 ps2PkOX227/MZlevgrP2xq9iI1O/pc2RZuAZceg=
X-Google-Smtp-Source: ABdhPJwc72IkCpqlUAkD2N6COr6Z9UoBbxNT+HyqgM6hgfK6BKb0VFBjmeorlwJoBv7YP/h3sg0gpQMOwlN/bnoRb4k=
X-Received: by 2002:ac2:5974:: with SMTP id h20mr1023017lfp.554.1615593623371; 
 Fri, 12 Mar 2021 16:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
 <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
 <YEt00vJ6oVfoRjSJ@kroah.com>
 <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
 <YEt+nAEOd+YUdln8@kroah.com>
In-Reply-To: <YEt+nAEOd+YUdln8@kroah.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 13 Mar 2021 09:00:12 +0900
Message-ID: <CACOAw_z9LUjx-5MRYnWOFnL9DzUkvKU1RVObRLwudZbpBxGywA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wikipedia.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.49 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lKrhm-007eiW-2C
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

MjAyMeuFhCAz7JuUIDEy7J28ICjquIgpIOyYpO2bhCAxMTo0NSwgR3JlZyBLSCA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+64uY7J20IOyekeyEsToKPgo+IEE6IGh0dHA6Ly9lbi53aWtpcGVk
aWEub3JnL3dpa2kvVG9wX3Bvc3QKPiBROiBXZXJlIGRvIEkgZmluZCBpbmZvIGFib3V0IHRoaXMg
dGhpbmcgY2FsbGVkIHRvcC1wb3N0aW5nPwo+IEE6IEJlY2F1c2UgaXQgbWVzc2VzIHVwIHRoZSBv
cmRlciBpbiB3aGljaCBwZW9wbGUgbm9ybWFsbHkgcmVhZCB0ZXh0Lgo+IFE6IFdoeSBpcyB0b3At
cG9zdGluZyBzdWNoIGEgYmFkIHRoaW5nPwo+IEE6IFRvcC1wb3N0aW5nLgo+IFE6IFdoYXQgaXMg
dGhlIG1vc3QgYW5ub3lpbmcgdGhpbmcgaW4gZS1tYWlsPwo+Cj4gQTogTm8uCj4gUTogU2hvdWxk
IEkgaW5jbHVkZSBxdW90YXRpb25zIGFmdGVyIG15IHJlcGx5Pwo+Cj4gaHR0cDovL2RhcmluZ2Zp
cmViYWxsLm5ldC8yMDA3LzA3L29uX3RvcAo+CgpUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdyB0
aGlzIQoKPgo+IE9uIEZyaSwgTWFyIDEyLCAyMDIxIGF0IDExOjM3OjI5UE0gKzA5MDAsIERhZWhv
IEplb25nIHdyb3RlOgo+ID4gQXMgeW91IGNhbiBzZWUsIGlmIHdlJ3JlIGRvaW5nIGxpa2UgdGhl
IGJlbG93Lgo+ID4KPiA+IHNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayArPSBibG9ja3M7Cj4gPgo+
ID4gTGV0J3MgYXNzdW1lIHRoZSBpbml0aWFsIHZhbHVlIGFzIDAuCj4gPgo+ID4gPHRocmVhZCBB
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0aHJlYWQgQj4K
PiA+IHNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayA9IDA7Cj4gPgo+ID4gc2JpLT5jb21wcl93cml0
dGVuX2Jsb2NrID0gMDsKPiA+ICtibG9ja3MoMyk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArIGJsb2NrcygyKTsKPiA+
IHNiaS0+Y29tcHJfd3JpdHRlbl9ibG9jayA9IDM7Cj4gPgo+ID4gc2JpLT5jb21wcl93cml0dGVu
X2Jsb2NrID0gMjsKPiA+Cj4gPiBGaW5hbGx5LCB3ZSBlbmQgdXAgd2l0aCAyLCBub3QgNS4KPiA+
Cj4gPiBBcyBtb3JlIHRocmVhZHMgYXJlIHBhcnRpY2lwYXRpbmcgaXQsIHdlIG1pZ2h0IG1pc3Mg
bW9yZSBjb3VudGluZy4KPgo+IEFyZSB5b3Ugc3VyZT8gIElzbid0IGFkZGluZyBhIG51bWJlciBz
b21ldGhpbmcgdGhhdCBzaG91bGQgaGFwcGVuIGluIGEKPiAic2FmZSIgd2F5Pwo+Cj4gQW5kIGlm
IHlvdSBtaXNzIDIgYmxvY2tzLCB3aG8gY2FyZXM/ICBXaGF0IGlzIHNvIGNyaXRpY2FsIGFib3V0
IHRoZXNlCj4gdGhpbmdzIHRoYXQgeW91IHRha2UgdGhlIGNhY2hlIGZsdXNoIG9mIDIgYXRvbWlj
IHdyaXRlcyBqdXN0IGZvciBhCj4gZGVidWdnaW5nIHN0YXRpc3RpYz8KPgo+IFdoeSBub3QganVz
dCB0YWtlIDEgbG9jayBmb3IgZXZlcnl0aGluZyBpZiBpdCdzIHNvIGltcG9ydGFudCB0byBnZXQK
PiB0aGVzZSAiY29ycmVjdCI/Cj4KPiBXaGF0IGlzIHRoZSBwZXJmb3JtYW5jZSB0aHJvdWdocHV0
IGRlZ3JhZGF0aW9uIG9mIGFkZGluZyAyIGF0b21pYyB3cml0ZXMKPiB0byBlYWNoIHRpbWUgeW91
IHdyaXRlIGEgYmxvY2s/Cj4KPiBCdXQgcmVhbGx5LCB3aWxsIHlvdSBldmVyIG5vdGljZSBtaXNz
aW5nIGEgZmV3LCBldmVuIGlmIHRoYXQgY291bGQgYmUKPiBwb3NzaWJsZSBvbiB5b3VyIGNwdSAo
YW5kIEkgc3Ryb25nbHkgZG91YnQgbW9zdCBtb2Rlcm4gY3B1cyB3aWxsIG1pc3MKPiB0aGlzLi4u
KQo+Cj4gQnV0IHRoaXMgaXNuJ3QgbXkgY29kZSwgSSBqdXN0IGhhdGUgc2VlaW5nIGF0b21pYyB2
YXJpYWJsZXMgdXNlZCBmb3IKPiBzaWxseSB0aGluZ3MgbGlrZSBkZWJ1Z2dpbmcgc3RhdHMgd2hl
biB0aGV5IGRvIG5vdCBzZWVtIHRvIGJlIHJlYWxseQo+IG5lZWRlZC4gIFNvIGlmIHlvdSB3YW50
IHRvIGtlZXAgdGhlbSwgZ28gYWhlYWQsIGJ1dCByZWFsaXplIHRoYXQgdGhlCj4gbnVtYmVyIHlv
dSBhcmUgcmVhZGluZyBoYXMgbm90aGluZyB0byBkbyB3aXRoIGJlaW5nICJhdG9taWMiIGF0IGFs
bC4KPgo+IHRoYW5rcywKPgoKSSBhZ3JlZSB0aGF0IG1pc3NpbmcgbnVtYmVyIHdvdWxkIGJlIGV4
dHJlbWVseSBmZXcgYW5kIHRoZSBvdmVyaGVhZCBvZgp1cGRhdGluZyB0aGUgbnVtYmVycyB3b3Vs
ZCBiZSBxdWl0ZSBiYWQuCgpUaGFua3MgZm9yIHlvdXIgdmFsdWFibGUgY29tbWVudHMuIDopCgo+
IGdyZWcgay1oCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
