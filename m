Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433EC32B48
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 19:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx7ozlKb7FzIk3u5Ylhq5Lwwzvt9eKArBPgy6TtGVqk=; b=WwA07cNAhRpnmi4bVvXFN0c1UZ
	wuwX09lm3v8Kqowa3rLO6px0U7e/TubNU06rm0CytrUCz0KHOeGjr7zyYBfDE0L6MtlbhWxD4YEbH
	5aK3rk0i+l5ZmTMbThKbTUqQHvj241s1mn3RT07O/x8AVCNj9NF9jUL5XhVZe7L3A1rM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGM7e-0007Gn-NN;
	Tue, 04 Nov 2025 18:51:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vGM7d-0007Gg-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 18:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YPkYNb3AdFbUUvWyK5+IEaMU2KcLnkNB85urH6+U/Jk=; b=miAHrjla5cueAFn5qychfIdoyw
 /lysrMi1GoVAJa11FKgK/GRbzIerxN/7BwrqKPMSEv/oawA4PfovyhAHOqwrWV7Qf/dH0mDcFnUXm
 jJ4RmdgQHe0IWJAa7wYUcj9sjLx9e4fYDtaQkOt/GVud1LiT1d/8tPBo7R8kXFiQQ8WQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YPkYNb3AdFbUUvWyK5+IEaMU2KcLnkNB85urH6+U/Jk=; b=RHVC2j09LmfpAM0XLe1DNbz9Sj
 J/zr5tbNr/oIJ9zaWTvnaqjhxXitu9Jn/eUET2fatJoiQwoLOSH8kFOhIXgqH4Qu2rvXyakUyIfzK
 +9sCieSgKudiTB4KPnjdDbqDK1HPTMSBHKWMQdSAIlwzVnossdVNdYoEy4wHQmZuTkTM=;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGM7b-0006U0-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 18:51:13 +0000
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso1141553666b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 10:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762282260; x=1762887060; darn=lists.sourceforge.net; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YPkYNb3AdFbUUvWyK5+IEaMU2KcLnkNB85urH6+U/Jk=;
 b=fqOqtZsKoccbtopkNe9IHGsNNP4ZO3/jhLG8BGlyiuQ/5hduoLKE3LAgFJWXTaxK3y
 tfE1b8O87lYI8dU7EvF4cglvlUjpTKUgNwXeS1plfmtlP3UPXxD5vlGau71qzxy3eQZA
 yiVcv8C/peXIi9xrd/Qh9TyfIcMNKk6ipLQqIUNCfWdnn1bTpt08rh2QNa5ubz8lbWap
 A3x6JY7j+VadyhfSx9+3MHogwFNT6yr6Kx/7S1X3hUm+CO9mYR7r0/0GUXCftqaFYcod
 oY9rFAsV2yfJsX8X6ChG2pCqq8O1Z4ckXCzmf9l9Po8I3eS+vrJDXra5WldZ23HWtc2O
 l1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762282260; x=1762887060;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPkYNb3AdFbUUvWyK5+IEaMU2KcLnkNB85urH6+U/Jk=;
 b=Zcth32dWtonVZnVXYYO1rP2wgBbSSM9d0AWX6ZN9JdtgoniSYutO1geV8FUrgOFob9
 7KrUR8+t5Pe3/6LiAkYccfNVPjnQTcC2Jyh+B65xaqb1mKyWCu7AtsRr+3Bd1peNuEZK
 /gTcIZRFvVYGagyTAU1B/eeMYGjgLsEQe7fPSLTnkCYyjlB7IDP9mdtdaD8SrtsmkGNA
 GpKqWiZDXzFAKPzYkEMpo7Nmue9t6gyKJrRb69JjjtMq3TRxd7KY2Rn9SSvpqL+t5Hx5
 fTtSx/uZ0eMAVJTfwFk+8/a3F79Ek6vuMnG16dW/NonqwuG3chR/KkJNgnfw9s6P8AzW
 KxMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPiSGlP4aIJM7qZnCbIno2tUGocys6Ak4wB2NFHhNMksZSq81I0IEGU/1JGOZWE+OoMZeDY38zRdUArC64TGv5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyqc8bcvyGX5cgdd4ivikqzhnkCjb7rTm16Yulq+tWPjlLU5sCy
 2HS+BJcUJ+6yZzN+g7Cl9FkiDfNuyhj2q68hOQCmGI/laRluANHdufJBhCdHyji6vjmjkNcaI5n
 bwm1u
X-Gm-Gg: ASbGncuuloyPtXEbxBu2YToyGnXqCDLzKpxgc+Bv0L8MVCNI4Uvma4zRY64tZPO/L7w
 2JCWG+UbzINdBEjlUvS6jfsGXTn8VHUtSmuwdxEyAuUwqt6P3139rgB4zS+pqa9h7T+w/H3ib3f
 +hvroganVPV8RFcYbMAyDkYv4d8UZozkPpkWUuxI4Idmxdi5KOsCx4JsDXzvbA0JvkTYOtbLQVo
 swiNRO+TQq37qlEssxSQGyZgdnDkUhLXccWtXxrsTpjVGySreUhChWaY9aW0+oga0QBuv/nEc8a
 DFwbi2C34p5NNiJ4wmEXZ32Itp6Cf+hhQIQc+rL6bK0UpHwfQ5P++qYs/907mCfkgj8RjTAX3n/
 EFD09Mj6kMVt+V+urje2qBwswCNn7vwXiksfCkmHnsoTYbcAxw2WIaC7waRNieQBbmpARUcKN1b
 5/OLo=
X-Google-Smtp-Source: AGHT+IFAz3YGZNVaEACS46pBOhwodMBp8mAa30t1ei+hvvakkC32yROwn5/v/BY4HZBMgQz5jF71mw==
X-Received: by 2002:a17:907:3f1b:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b726529edfemr13155566b.24.1762280751465; 
 Tue, 04 Nov 2025 10:25:51 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723d3a3d4asm277568566b.2.2025.11.04.10.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:25:51 -0800 (PST)
Date: Tue, 4 Nov 2025 19:25:48 +0100
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <aQpFLJM96uRpO4S-@pathway.suse.cz>
References: <CAJnrk1bF8sLU6tG2MGkt_KR4BoTd_k01CMVZJ9js2-eyh80tbw@mail.gmail.com>
 <69096836.a70a0220.88fb8.0006.GAE@google.com>
 <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJnrk1Yo4dRVSaPCaAGkHc+in03KaTXJ+KxckhLoSrRxbEdDBg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Adding John into Cc. On Tue 2025-11-04 09:45:27, Joanne Koong
 wrote: > On Mon, Nov 3, 2025 at 6:43 PM syzbot >
 <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>
 wrote: > > > > Hello, > > > > syzbot has tested the pr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.48 listed in wl.mailspike.net]
X-Headers-End: 1vGM7b-0006U0-Oa
Subject: Re: [f2fs-dev] [syzbot] [iomap?] kernel BUG in folio_end_read (2)
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
From: Petr Mladek via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: brauner@kernel.org, John Ogness <john.ogness@linutronix.de>,
 djwong@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot <syzbot+3686758660f980b402dc@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org,
 "amurray@thegoodpenguin.co.uk" <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QWRkaW5nIEpvaG4gaW50byBDYy4KCk9uIFR1ZSAyMDI1LTExLTA0IDA5OjQ1OjI3LCBKb2FubmUg
S29vbmcgd3JvdGU6Cj4gT24gTW9uLCBOb3YgMywgMjAyNSBhdCA2OjQz4oCvUE0gc3l6Ym90Cj4g
PHN5emJvdCszNjg2NzU4NjYwZjk4MGI0MDJkY0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tPiB3
cm90ZToKPiA+Cj4gPiBIZWxsbywKPiA+Cj4gPiBzeXpib3QgaGFzIHRlc3RlZCB0aGUgcHJvcG9z
ZWQgcGF0Y2ggYnV0IHRoZSByZXByb2R1Y2VyIGlzIHN0aWxsIHRyaWdnZXJpbmcgYW4gaXNzdWU6
Cj4gPiBXQVJOSU5HIGluIGdldF9kYXRhCj4gPgo+ID4gbG9vcDA6IGRldGVjdGVkIGNhcGFjaXR5
IGNoYW5nZSBmcm9tIDAgdG8gMTYKPiA+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLQo+ID4gV0FSTklORzoga2VybmVsL3ByaW50ay9wcmludGtfcmluZ2J1ZmZlci5jOjEyNzgg
YXQgZ2V0X2RhdGErMHg0OGEvMHg4NDAga2VybmVsL3ByaW50ay9wcmludGtfcmluZ2J1ZmZlci5j
OjEyNzgsIENQVSMxOiBzeXouMC41ODUvNzY1MgoKSXQgc2VlbXMgdG8gdHJpZ2dlciBhbiAiSWxs
ZWdhYyBibG9jayBkZXNjcmlwdGlvbiIgd2FybmluZywgc2VlIDoKCiAgIDEyNjMgICAgICAgICAv
KiBSZWd1bGFyIGRhdGEgYmxvY2s6IEBiZWdpbiBsZXNzIHRoYW4gQG5leHQgYW5kIGluIHNhbWUg
d3JhcC4gKi8KICAgMTI2NCAgICAgICAgIGlmICghaXNfYmxrX3dyYXBwZWQoZGF0YV9yaW5nLCBi
bGtfbHBvcy0+YmVnaW4sIGJsa19scG9zLT5uZXh0KSAmJgogICAxMjY1ICAgICAgICAgICAgIGJs
a19scG9zLT5iZWdpbiA8IGJsa19scG9zLT5uZXh0KSB7CiAgIDEyNjYgICAgICAgICAgICAgICAg
IGRiID0gdG9fYmxvY2soZGF0YV9yaW5nLCBibGtfbHBvcy0+YmVnaW4pOwogICAxMjY3ICAgICAg
ICAgICAgICAgICAqZGF0YV9zaXplID0gYmxrX2xwb3MtPm5leHQgLSBibGtfbHBvcy0+YmVnaW47
CiAgIDEyNjggCiAgIDEyNjkgICAgICAgICAvKiBXcmFwcGluZyBkYXRhIGJsb2NrOiBAYmVnaW4g
aXMgb25lIHdyYXAgYmVoaW5kIEBuZXh0LiAqLwogICAxMjcwICAgICAgICAgfSBlbHNlIGlmICgh
aXNfYmxrX3dyYXBwZWQoZGF0YV9yaW5nLAogICAxMjcxICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYmxrX2xwb3MtPmJlZ2luICsgREFUQV9TSVpFKGRhdGFfcmluZyksCiAgIDEy
NzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibGtfbHBvcy0+bmV4dCkpIHsK
ICAgMTI3MyAgICAgICAgICAgICAgICAgZGIgPSB0b19ibG9jayhkYXRhX3JpbmcsIDApOwogICAx
Mjc0ICAgICAgICAgICAgICAgICAqZGF0YV9zaXplID0gREFUQV9JTkRFWChkYXRhX3JpbmcsIGJs
a19scG9zLT5uZXh0KTsKICAgMTI3NSAKICAgMTI3NiAgICAgICAgIC8qIElsbGVnYWwgYmxvY2sg
ZGVzY3JpcHRpb24uICovCiAgIDEyNzcgICAgICAgICB9IGVsc2UgewogICAxMjc4ICAgICAgICAg
ICAgICAgICBXQVJOX09OX09OQ0UoMSk7CQk8LS0tLS0tLS0tLS0KICAgMTI3OSAgICAgICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7CiAgIDEyODAgICAgICAgICB9CgoKPiA+IE1vZHVsZXMgbGlua2Vk
IGluOgo+ID4gQ1BVOiAxIFVJRDogMCBQSUQ6IDc2NTIgQ29tbTogc3l6LjAuNTg1IE5vdCB0YWlu
dGVkIHN5emthbGxlciAjMCBQUkVFTVBUKGZ1bGwpCj4gPiBIYXJkd2FyZSBuYW1lOiBHb29nbGUg
R29vZ2xlIENvbXB1dGUgRW5naW5lL0dvb2dsZSBDb21wdXRlIEVuZ2luZSwgQklPUyBHb29nbGUg
MTAvMDIvMjAyNQo+ID4gUklQOiAwMDEwOmdldF9kYXRhKzB4NDhhLzB4ODQwIGtlcm5lbC9wcmlu
dGsvcHJpbnRrX3JpbmdidWZmZXIuYzoxMjc4Cj4gPiBDb2RlOiA4MyBjNCBmOCA0OCBiOCAwMCAw
MCAwMCAwMCAwMCBmYyBmZiBkZiA0MSAwZiBiNiAwNCAwNyA4NCBjMCAwZiA4NSBlZSAwMSAwMCAw
MCA0NCA4OSA2NSAwMCA0OSA4MyBjNSAwOCBlYiAxMyBlOCBhNyAxOSAxZiAwMCA5MCA8MGY+IDBi
IDkwIGViIDA1IGU4IDljIDE5IDFmIDAwIDQ1IDMxIGVkIDRjIDg5IGU4IDQ4IDgzIGM0IDI4IDVi
IDQxCj4gPiBSU1A6IDAwMTg6ZmZmZmM5MDAwMzUxNzBlMCBFRkxBR1M6IDAwMDEwMjkzCj4gPiBS
QVg6IGZmZmZmZmZmODFhMWVlZTkgUkJYOiAwMDAwM2ZmZmZmZmZmZmZmIFJDWDogZmZmZjg4ODAz
MzI1NWI4MAo+ID4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDNmZmZmZmZmZmZmZiBS
REk6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFJCUDogMDAwMDAwMDAwMDAwMDAxMiBSMDg6IDAwMDAw
MDAwMDAwMDBlNTUgUjA5OiAwMDAwMDAzMjVlMjEzY2M3Cj4gPiBSMTA6IDAwMDAwMDMyNWUyMTNj
YzcgUjExOiAwMDAwMWRlNGMyMDAwMDM3IFIxMjogMDAwMDAwMDAwMDAwMDAxMgo+ID4gUjEzOiAw
MDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZmM5MDAwMzUxNzIyOCBSMTU6IDFmZmZmZmZmZjFiY2E2
NDYKPiA+IEZTOiAgMDAwMDdmNDRlYjhkYTZjMCgwMDAwKSBHUzpmZmZmODg4MTI1ZmRhMDAwKDAw
MDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiA+IENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiA+IENSMjogMDAwMDdmNDRlYTk3MjJlMCBDUjM6IDAw
MDAwMDAwNjYzNDQwMDAgQ1I0OiAwMDAwMDAwMDAwMzUyNmYwCj4gPiBDYWxsIFRyYWNlOgo+ID4g
IDxUQVNLPgo+ID4gIGNvcHlfZGF0YSBrZXJuZWwvcHJpbnRrL3ByaW50a19yaW5nYnVmZmVyLmM6
MTg1NyBbaW5saW5lXQo+ID4gIHByYl9yZWFkIGtlcm5lbC9wcmludGsvcHJpbnRrX3JpbmdidWZm
ZXIuYzoxOTY2IFtpbmxpbmVdCj4gPiAgX3ByYl9yZWFkX3ZhbGlkKzB4NjcyLzB4YTkwIGtlcm5l
bC9wcmludGsvcHJpbnRrX3JpbmdidWZmZXIuYzoyMTQzCj4gPiAgcHJiX3JlYWRfdmFsaWQrMHgz
Yy8weDYwIGtlcm5lbC9wcmludGsvcHJpbnRrX3JpbmdidWZmZXIuYzoyMjE1Cj4gPiAgcHJpbnRr
X2dldF9uZXh0X21lc3NhZ2UrMHgxNWMvMHg3YjAga2VybmVsL3ByaW50ay9wcmludGsuYzoyOTc4
Cj4gPiAgY29uc29sZV9lbWl0X25leHRfcmVjb3JkIGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MzA2
MiBbaW5saW5lXQo+ID4gIGNvbnNvbGVfZmx1c2hfb25lX3JlY29yZCBrZXJuZWwvcHJpbnRrL3By
aW50ay5jOjMxOTQgW2lubGluZV0KPiA+ICBjb25zb2xlX2ZsdXNoX2FsbCsweDRjYy8weGIxMCBr
ZXJuZWwvcHJpbnRrL3ByaW50ay5jOjMyNjgKPiA+ICBfX2NvbnNvbGVfZmx1c2hfYW5kX3VubG9j
ayBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjMyOTggW2lubGluZV0KPiA+ICBjb25zb2xlX3VubG9j
aysweGJiLzB4MTkwIGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MzMzOAo+ID4gIHZwcmludGtfZW1p
dCsweDRjNS8weDU5MCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjI0MjMKPiA+ICBfcHJpbnRrKzB4
Y2YvMHgxMjAga2VybmVsL3ByaW50ay9wcmludGsuYzoyNDQ4Cj4gPiAgX2Vyb2ZzX3ByaW50aysw
eDM0OS8weDQxMCBmcy9lcm9mcy9zdXBlci5jOjMzCj4gPiAgZXJvZnNfZmNfZmlsbF9zdXBlcisw
eDE1OTEvMHgxYjIwIGZzL2Vyb2ZzL3N1cGVyLmM6NzQ2Cj4gPiAgZ2V0X3RyZWVfYmRldl9mbGFn
cysweDQwZS8weDRkMCBmcy9zdXBlci5jOjE2OTIKPiA+ICB2ZnNfZ2V0X3RyZWUrMHg5Mi8weDJi
MCBmcy9zdXBlci5jOjE3NTIKPiA+ICBmY19tb3VudCBmcy9uYW1lc3BhY2UuYzoxMTk4IFtpbmxp
bmVdCj4gPiAgZG9fbmV3X21vdW50X2ZjIGZzL25hbWVzcGFjZS5jOjM2NDEgW2lubGluZV0KPiA+
ICBkb19uZXdfbW91bnQrMHgzMDIvMHhhMTAgZnMvbmFtZXNwYWNlLmM6MzcxNwo+ID4gIGRvX21v
dW50IGZzL25hbWVzcGFjZS5jOjQwNDAgW2lubGluZV0KPiA+ICBfX2RvX3N5c19tb3VudCBmcy9u
YW1lc3BhY2UuYzo0MjI4IFtpbmxpbmVdCj4gPiAgX19zZV9zeXNfbW91bnQrMHgzMTMvMHg0MTAg
ZnMvbmFtZXNwYWNlLmM6NDIwNQo+ID4gIGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5
c2NhbGxfNjQuYzo2MyBbaW5saW5lXQo+ID4gIGRvX3N5c2NhbGxfNjQrMHhmYS8weGZhMCBhcmNo
L3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6OTQKPiA+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3
ZnJhbWUrMHg3Ny8weDdmCj4gPiBSSVA6IDAwMzM6MHg3ZjQ0ZWE5OTA3NmEKPiA+IENvZGU6IGQ4
IDY0IDg5IDAyIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGViIGE2IGU4IGRlIDFhIDAwIDAwIDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQwIDAwIDQ5IDg5IGNhIGI4IGE1IDAwIDAw
IDAwIDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggYzcgYzEgYTggZmYgZmYg
ZmYgZjcgZDggNjQgODkgMDEgNDgKPiA+IFJTUDogMDAyYjowMDAwN2Y0NGViOGQ5ZTY4IEVGTEFH
UzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwYTUKPiA+IFJBWDogZmZmZmZmZmZm
ZmZmZmZkYSBSQlg6IDAwMDA3ZjQ0ZWI4ZDllZjAgUkNYOiAwMDAwN2Y0NGVhOTkwNzZhCj4gPiBS
RFg6IDAwMDAyMDAwMDAwMDAxODAgUlNJOiAwMDAwMjAwMDAwMDAwMWMwIFJESTogMDAwMDdmNDRl
YjhkOWViMAo+ID4gUkJQOiAwMDAwMjAwMDAwMDAwMTgwIFIwODogMDAwMDdmNDRlYjhkOWVmMCBS
MDk6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAw
MDAwMDAwMDAyNDYgUjEyOiAwMDAwMjAwMDAwMDAwMWMwCj4gPiBSMTM6IDAwMDA3ZjQ0ZWI4ZDll
YjAgUjE0OiAwMDAwMDAwMDAwMDAwMWExIFIxNTogMDAwMDIwMDAwMDAwMDA4MAo+ID4gIDwvVEFT
Sz4KPiA+Cj4gCj4gVGhpcyBsb29rcyB1bnJlbGF0ZWQgdG8gdGhlIGlvbWFwIGNoYW5nZXMgYW5k
IHNlZW1zIHRpZWQgdG8gdGhlIHJlY2VudAo+IHByaW50ayBjb25zb2xlIGZsdXNoaW5nIGNoYW5n
ZXMuIEhtbSwgbWF5YmUgb25lIG9mIHRoZXNlIGNoYW5nZXMKPiBbMSwyLDNdPwo+PiAKPiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDIwLXByaW50a19sZWdhY3lfdGhyZWFk
X2NvbnNvbGVfbG9jay12My0xLTAwZjFmMGFjMDU1YUB0aGVnb29kcGVuZ3Vpbi5jby51ay8KPiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDIwLXByaW50a19sZWdhY3lfdGhy
ZWFkX2NvbnNvbGVfbG9jay12My0yLTAwZjFmMGFjMDU1YUB0aGVnb29kcGVuZ3Vpbi5jby51ay8K
PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDIwLXByaW50a19sZWdhY3lf
dGhyZWFkX2NvbnNvbGVfbG9jay12My0zLTAwZjFmMGFjMDU1YUB0aGVnb29kcGVuZ3Vpbi5jby51
ay8KClRoZXNlIHBhdGNoZXMgbW9kaWZpZWQgdGhlIGNhbGxlcnMgb2YgdGhlIHByaW50a19yaW5n
YnVmZmVyIEFQSS4KSSBkb3VidCB0aGF0IHRoZXkgbWlnaHQgY2F1c2UgdGhlIHByb2JsZW0uCgpJ
dCByYXRoZXIgbG9va3MgbGlrZSBhbiBpbnRlcm5hbCBidWcgaW4gdGhlIHByaW50a19yaW5nYnVm
ZmVyIGNvZGUuCkFuZCB0aGVyZSBpcyBvbmx5IG9uZSByZWNlbnQgcGF0Y2g6CgogICBodHRwczov
L3BhdGNoLm1zZ2lkLmxpbmsvMjAyNTA5MDUxNDQxNTIuOTEzNy0yLWQtdGF0aWFuaW5AeWFuZGV4
LXRlYW0ucnUKClRoZSBzY2VuYXJpbyBsZWFkaW5nIHRvIHRoZSBXQVJOKCkgaXMgbm90IG9idmlv
dXMgdG8gbWUuIEJ1dCB0aGUgcGF0Y2gKdG91Y2hlZCB0aGlzIGNvZGUgcGF0aC4gU28gaXQgaXMg
YSBsaWtlbHkgY3VscHJpdC4gSSBoYXZlIHRvIHRoaW5rCm1vcmUgYWJvdXQgaXQuCgpBbnl3YXks
IEkgd29uZGVyIGlmIHRoZSBXQVJOSU5HIGlzIHJlcHJvZHVjaWJsZSBhbmQgaWYgaXQgaGFwcGVu
cyBldmVuIGFmdGVyCnJldmVydGluZyB0aGUgY29tbWl0IDY3ZTFiMDA1MmY2YmI4MmJlODRlMyAo
InByaW50a19yaW5nYnVmZmVyOiBkb24ndApuZWVkbGVzc2x5IHdyYXAgZGF0YSBibG9ja3MgYXJv
dW5kIikKCkJlc3QgUmVnYXJkcywKUGV0cgoKPiBUaGFua3MsCj4gSm9hbm5lCj4gCj4gPgo+ID4g
VGVzdGVkIG9uOgo+ID4KPiA+IGNvbW1pdDogICAgICAgICA5ODIzMTIwOSBBZGQgbGludXgtbmV4
dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNTExMDMKPiA+IGdpdCB0cmVlOiAgICAgICBsaW51eC1u
ZXh0Cj4gPiBjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9s
b2cudHh0P3g9MTM3MGEyOTI1ODAwMDAKPiA+IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD00M2NjMGUzMTU1OGNiNTI3Cj4gPiBkYXNoYm9h
cmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTM2ODY3NTg2
NjBmOTgwYjQwMmRjCj4gPiBjb21waWxlcjogICAgICAgRGViaWFuIGNsYW5nIHZlcnNpb24gMjAu
MS44ICgrKzIwMjUwNzA4MDYzNTUxKzBjOWY5MDliNzk3Ni0xfmV4cDF+MjAyNTA3MDgxODM3MDIu
MTM2KSwgRGViaWFuIExMRCAyMC4xLjgKPiA+Cj4gPiBOb3RlOiBubyBwYXRjaGVzIHdlcmUgYXBw
bGllZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
