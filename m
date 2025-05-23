Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF118AC1AB4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 05:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97FytZIzlyusxkmzwW8jnI/xeSUlWi3/gCwer58JHTU=; b=QiQWppIJDkPFZxLkpmm7Xy1xjd
	Z+jyYPkp4T4y/HtlNts5bUF6j4Shq+7EzF62xp8poYPBcABldolKvSZuJKW+9oDly7jjlsmWPyKKF
	Z9IY80KT/XS1kYFwasg975Koa+xR/+3vcpXjZHGKAQMZ+AL49HG5UgHGteyL4D2nhyLk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIJCp-000338-1o;
	Fri, 23 May 2025 03:36:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uIJCn-000330-30
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 03:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=; b=YriOy4F6GMJGRigFYttAgzebF2
 KV2xT3B7X8kLW2Jq35k2wUrjF/cX2+by0WcEfxW2a5HdpuxwUSmhSa7RZ/FCaMYWX92sqI1vubD4t
 FoWrDexM98Df6/1jawy9emrtLluA+1i7wbR4oxWUDJC58EXL9HmfKRQ2PirIfLBuhgp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=; b=c3G0vv3KUhnwNa0rPxGqK/d3i5
 X+PbrRWv2iuh1FnqYYCmGtwtYQy/yaIAmqFi/DhTZRLErRoJHb2RRcFUSk+oAu0nfxG8fUW/S/AqA
 m8mcAgciA1rIiVIJ/sUKY72+IXJDbIuVGLatH3efRbEcehy8cCOKCDwAXtv5fPv3/Ri4=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uIJCl-0001f8-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 03:36:21 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a36977f261so908570f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 May 2025 20:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747971368; x=1748576168; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=;
 b=arl881Slc49XfANAbT4GmMgtQ4fX0+egyzKmLIJTVhK0bO3WfTztPena1BL+sdk9rJ
 NJttLAD+nwXciDjJY/d2hrwaSyTRBFFLb69YFpP0E7fIVxNA/SYAGEvISl6TAcPevfpx
 oZ8x/5+1pxnUb7B7rZvKR9DrjCaWogt3HAeAsEAgY3UVEoZMwFX8HEJEz6wYLCZX3kia
 JMFSgjtz1a70H4HySw5Twgtltewmm3nN8+avZTzEBhOQIY1QNgGObg4VWIDnToQrUJv/
 MzuwbCNmAbShsHnT5OVWjnCNAFhIF0b5cGsE95t5DslZD4RhrvRi3rrlYdlWOlt2D9O6
 pKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747971368; x=1748576168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=;
 b=ureVRsnaNTf4ycqhia/wCrNQ6PnLUJUAKY7NJ7HZ+CxlhAjBszryYcmgEuNrjORw7f
 DjLvE8TQ2kVVKFZ+xUMmqZ2BmOBTznXcsTJ+zVCap1qzHrb9ESEdsKEiqWEtkBKTErtr
 P2busZ1k8oCyuSXP0QVcRuFVT+XqRsJTtQMsPhgD+mkHh6rsmxoYTPT5imq5YxGZ7L9L
 95mGg+s7m+ggJ/bEfCUMgfIcvghLMjqmvE2LimAxBVVoskQw5g8CGOSzu0mtzJMfBL5Q
 dzvgxYIJgGB32npgicErrPGFLCbwqogKFTa/Wxj9Lf2MSKQIB1gAxJV4KrEJqq/ueCaD
 dAiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2q6Rr6C1n5Y7AlFpPUc+mJ0ONiLXjDvEm3rIzFlGeax9NBDNBnOUUweFZU9e5qZEfD6oac/GAgjI1YaVPsk7P@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz+fBlYPQ2reZxz0weOg1Q8Y1SitZxLKMvByN4qDFehHGYxAFWJ
 agYBnLFVaVMOQPhr8NX81t/op8smSSw7qr5DZb3RaX4KzPNb9Rqgzaceq5fNRn3zwUFn8V5Bx+W
 y+CmpcBKjW+GPqwWeSvvwf1co2WYevenPQZ0X
X-Gm-Gg: ASbGncvqGZoiQ/W3I1gcnMiKX26S4FNfS6x7bt7PugVJ+q+mqKk2KlmFn6Cyhg+1N1P
 A6QtZkkhXtD5zsE2IQ3R9j4pfP9AMcDbHwRFF8Sof8GHGQ/KQywYmKT2hhOENXEB5vX1oHHBEZx
 kalx7oTC6azOXGtBJbQAdWb9JhyCeyv4fSyg==
X-Google-Smtp-Source: AGHT+IG8tDj9VUbVSSZCdOnpRLycP6PESNY5fDQ2iVNmW7wMk4wsbP81qGjQ8GGsn73OHPv2MraJUKNDkTFYkZxZCak=
X-Received: by 2002:a05:600c:138c:b0:43b:c844:a4ba with SMTP id
 5b1f17b1804b1-44b8ab9b6d3mr2394265e9.3.1747971367970; Thu, 22 May 2025
 20:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250523032545.1392641-1-chao@kernel.org>
In-Reply-To: <20250523032545.1392641-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 23 May 2025 11:35:56 +0800
X-Gm-Features: AX0GCFs4AKTY9dD6cR9VFip4Is95mD1bH4fpqPkJIkd07O28bhyoBRQiQCkif7I
Message-ID: <CAHJ8P3KVFDbOsSjdbA=LqcT2PGNbgNOibWEn6Y6cqGOgvkjO6Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年5月23日周五 11:30写道：
    > > Syzbot reports a f2fs bug as below: > > INFO: task syz-executor328:5856
    blocked for more than 144 seconds. > Not tainted 6.1 [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
                             trust
                             [209.85.221.53 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1uIJCl-0001f8-W3
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
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
Cc: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ15pyIMjPml6XlkajkupQgMTE6MzDlhpnpgZPvvJoKPgo+
IFN5emJvdCByZXBvcnRzIGEgZjJmcyBidWcgYXMgYmVsb3c6Cj4KPiBJTkZPOiB0YXNrIHN5ei1l
eGVjdXRvcjMyODo1ODU2IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxNDQgc2Vjb25kcy4KPiAgICAg
ICBOb3QgdGFpbnRlZCA2LjE1LjAtcmM2LXN5emthbGxlci0wMDIwOC1nM2MyMTQ0MWVlZmZjICMw
Cj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlz
YWJsZXMgdGhpcyBtZXNzYWdlLgo+IHRhc2s6c3l6LWV4ZWN1dG9yMzI4IHN0YXRlOkQgc3RhY2s6
MjQzOTIgcGlkOjU4NTYgIHRnaWQ6NTgzMiAgcHBpZDo1ODI2ICAgdGFza19mbGFnczoweDQwMDA0
MCBmbGFnczoweDAwMDA0MDA2Cj4gQ2FsbCBUcmFjZToKPiAgPFRBU0s+Cj4gIGNvbnRleHRfc3dp
dGNoIGtlcm5lbC9zY2hlZC9jb3JlLmM6NTM4MiBbaW5saW5lXQo+ICBfX3NjaGVkdWxlKzB4MTY4
Zi8weDRjNzAga2VybmVsL3NjaGVkL2NvcmUuYzo2NzY3Cj4gIF9fc2NoZWR1bGVfbG9vcCBrZXJu
ZWwvc2NoZWQvY29yZS5jOjY4NDUgW2lubGluZV0KPiAgc2NoZWR1bGUrMHgxNjUvMHgzNjAga2Vy
bmVsL3NjaGVkL2NvcmUuYzo2ODYwCj4gIGlvX3NjaGVkdWxlKzB4ODEvMHhlMCBrZXJuZWwvc2No
ZWQvY29yZS5jOjc3NDIKPiAgZjJmc19iYWxhbmNlX2ZzKzB4NGI0LzB4NzgwIGZzL2YyZnMvc2Vn
bWVudC5jOjQ0NAo+ICBmMmZzX21hcF9ibG9ja3MrMHgzYWYxLzB4NDNiMCBmcy9mMmZzL2RhdGEu
YzoxNzkxCj4gIGYyZnNfZXhwYW5kX2lub2RlX2RhdGErMHg2NTMvMHhhZjAgZnMvZjJmcy9maWxl
LmM6MTg3Mgo+ICBmMmZzX2ZhbGxvY2F0ZSsweDRmNS8weDk5MCBmcy9mMmZzL2ZpbGUuYzoxOTc1
Cj4gIHZmc19mYWxsb2NhdGUrMHg2YTAvMHg4MzAgZnMvb3Blbi5jOjMzOAo+ICBpb2N0bF9wcmVh
bGxvY2F0ZSBmcy9pb2N0bC5jOjI5MCBbaW5saW5lXQo+ICBmaWxlX2lvY3RsIGZzL2lvY3RsLmM6
LTEgW2lubGluZV0KPiAgZG9fdmZzX2lvY3RsKzB4MWI4Zi8weDFlYjAgZnMvaW9jdGwuYzo4ODUK
PiAgX19kb19zeXNfaW9jdGwgZnMvaW9jdGwuYzo5MDQgW2lubGluZV0KPiAgX19zZV9zeXNfaW9j
dGwrMHg4Mi8weDE3MCBmcy9pb2N0bC5jOjg5Mgo+ICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9l
bnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lubGluZV0KPiAgZG9fc3lzY2FsbF82NCsweGY2LzB4MjEw
IGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo5NAo+ICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVy
X2h3ZnJhbWUrMHg3Ny8weDdmCj4KPiBUaGUgcm9vdCBjYXVzZSBpcyBhZnRlciBjb21taXQgODRi
NWJiOGJmMGY2ICgiZjJmczogbW9kaWZ5Cj4gZjJmc19pc19jaGVja3BvaW50X3JlYWR5IGxvZ2lj
IHRvIGFsbG93IG1vcmUgZGF0YSB0byBiZSB3cml0dGVuIHdpdGggdGhlCj4gQ1AgZGlzYWJsZSIp
LCB3ZSB3aWxsIGdldCBjaGFuY2UgdG8gYWxsb3cgZjJmc19pc19jaGVja3BvaW50X3JlYWR5KCkg
dG8KPiByZXR1cm4gdHJ1ZSBvbmNlIGJlbG93IGNvbmRpdGlvbnMgYXJlIGFsbCB0cnVlOgo+IDEu
IGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQKPiAyLiB0aGVyZSBhcmUgbm90IGVub3VnaCBmcmVlIHNl
Z21lbnRzCj4gMy4gdGhlcmUgYXJlIGVub3VnaCBmcmVlIGJsb2Nrcwo+Cj4gVGhlbiBpdCB3aWxs
IGNhdXNlIGYyZnNfYmFsYW5jZV9mcygpIHRvIHRyaWdnZXIgZm9yZWdyb3VuZCBHQy4KPgo+IHZv
aWQgZjJmc19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+
IC4uLgo+ICAgICAgICAgaWYgKCFmMmZzX2lzX2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+Cj4gQW5kIHRoZSB0ZXN0Y2FzZSBtb3VudHMgZjJmcyBpbWFn
ZSB3LyBnY19tZXJnZSxjaGVja3BvaW50PWRpc2FibGUsIHNvIGRlYWRsb29wCj4gd2lsbCBoYXBw
ZW4gdGhyb3VnaCBiZWxvdyByYWNlIGNvbmRpdGlvbjoKPgo+IC0gZjJmc19kb19zaHV0ZG93biAg
ICAgICAgICAgICAgLSB2ZnNfZmFsbG9jYXRlICAgICAgICAgICAgICAgICAgICAgICAgIC0gZ2Nf
dGhyZWFkX2Z1bmMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGZpbGVfc3Rh
cnRfd3JpdGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBfX3NiX3N0YXJ0
X3dyaXRlKFNCX0ZSRUVaRV9XUklURSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIGYyZnNfZmFsbG9jYXRlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0g
ZjJmc19leHBhbmRfaW5vZGVfZGF0YQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLSBmMmZzX21hcF9ibG9ja3MKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIGYyZnNfYmFsYW5jZV9mcwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIHByZXBhcmVfdG9fd2FpdAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIHdha2VfdXAoZ2Nfd2FpdF9xdWV1ZV9oZWFkKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtIGlvX3NjaGVkdWxlCj4gIC0gYmRldl9mcmVlemUKPiAgIC0gZnJlZXpl
X3N1cGVyCj4gICAgLSBzYi0+c193cml0ZXJzLmZyb3plbiA9IFNCX0ZSRUVaRV9XUklURTsKPiAg
ICAtIHNiX3dhaXRfd3JpdGUoc2IsIFNCX0ZSRUVaRV9XUklURSk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0gaWYgKHNiaS0+c2ItPnNfd3JpdGVycy5mcm96ZW4gPj0gU0JfRlJFRVpFX1dSSVRFKSBjb250
aW51ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiBjYXVzZSBkZWFkbG9vcAo+Cj4gVGhpcyBwYXRjaCBm
aXggdG8gYWRkIGNoZWNrIGNvbmRpdGlvbiBpbiBmMmZzX2JhbGFuY2VfZnMoKSwgc28gdGhhdCBp
Zgo+IGNoZWNrcG9pbnQgaXMgZGlzYWJsZWQsIHdlIHdpbGwganVzdCBza2lwIHRyaWdnZXIgZm9y
ZWdyb3VuZCBHQyB0bwo+IGF2b2lkIHN1Y2ggZGVhZGxvb3AgaXNzdWUuCj4KPiBNZWFud2hpbGUg
bGV0J3MgcmVtb3ZlIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeSgpIGNoZWNrIGNvbmRpdGlvbiBp
bgo+IGYyZnNfYmFsYW5jZV9mcygpLCBzaW5jZSBpdCdzIHJlZHVuZGFudCwgZHVlIHRvIHRoZSBt
YWluIGxvZ2ljIGluIHRoZQo+IGZ1bmN0aW9uIGlzIHRvIGNoZWNrOgo+IGEpIHdoZXRoZXIgY2hl
Y2twb2ludCBpcyBkaXNhYmxlZAo+IGIpIHRoZXJlIGlzIGVub3VnaCBmcmVlIHNlZ21lbnRzCj4K
PiBmMmZzX2JhbGFuY2VfZnMoKSBzdGlsbCBoYXMgYWxsIGxvZ2ljcyBhZnRlciBmMmZzX2lzX2No
ZWNrcG9pbnRfcmVhZHkoKSdzCj4gcmVtb3ZhbC4KPgo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrYWE1
YmI1ZjY4NjBlMDhhNjA0NTBAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IENsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC82ODJkNzQzYS5hMDBhMDIyMC4y
OWJjMjYuMDI4OS5HQUVAZ29vZ2xlLmNvbQo+IEZpeGVzOiA4NGI1YmI4YmYwZjYgKCJmMmZzOiBt
b2RpZnkgZjJmc19pc19jaGVja3BvaW50X3JlYWR5IGxvZ2ljIHRvIGFsbG93IG1vcmUgZGF0YSB0
byBiZSB3cml0dGVuIHdpdGggdGhlIENQIGRpc2FibGUiKQo+IENjOiBRaSBIYW4gPGhhbnFpQHZp
dm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiB2MzoKPiAtIGNsZWFuIHVwIHRoZSBjb2Rlcwo+ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4IDVm
ZjAxMTFlZDk3NC4uMjRiNGJiMmE0YjliIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtNDMzLDcgKzQzMyw3IEBAIHZvaWQgZjJm
c19iYWxhbmNlX2ZzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBuZWVkKQo+ICAgICAg
ICAgaWYgKG5lZWQgJiYgZXhjZXNzX2NhY2hlZF9uYXRzKHNiaSkpCj4gICAgICAgICAgICAgICAg
IGYyZnNfYmFsYW5jZV9mc19iZyhzYmksIGZhbHNlKTsKPgo+IC0gICAgICAgaWYgKCFmMmZzX2lz
X2NoZWNrcG9pbnRfcmVhZHkoc2JpKSkKPiArICAgICAgIGlmICh1bmxpa2VseShpc19zYmlfZmxh
Z19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwoK
UmV2aWV3ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KdGhhbmtzIQo+
Cj4gICAgICAgICAvKgo+IC0tCj4gMi40OS4wCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
