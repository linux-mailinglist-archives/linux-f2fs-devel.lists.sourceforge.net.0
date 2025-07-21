Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D417B0B9B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 03:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLTvRzeYwj51Wi4Snf4oRSLWSy2iIQ2enH9lSIXzjsM=; b=OD2MN/6YHzcgyesrmjK1BHgbrV
	8wwQzlPCj8T70zgF8TmGW8GQl69JOI1xoIsSikma+Zi+fJFZ+Mv7nvF+Z5YBWON18SsfOLqTvm1FW
	qU9eTQ90SVGDDjE9Wj6TEAznv1CYuoQ68dFyHv/u04kk+g9/ey6bCXiJQdxmoN35/vz4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udevt-0003df-43;
	Mon, 21 Jul 2025 01:03:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1udevs-0003dV-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 01:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=; b=KqwpClUN68EHXEk44C+Gfz1uRi
 GDWeIOfQuIDhlI/WLO/CoyXliu74a2sTEspw9bSxzxcPR1kUlVS68IehT+ERzuFNnWle1+GlHwiHt
 KgTfNPeTwWet2Vmp8+BTBKLT3kpwL9R20a+gNZdHhmb72NjPqmD7BdrOzHLQtsGDR0l0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=; b=ZDgUoTzqIyONFXMteGQ8YiygDd
 L52UfEvDedqMtcFTxOL7SfUru3sHSOT4mH5UkBMn+6hhZUUNHCGxQ46F/OBCx9NN/uIHqmAo+EP4R
 WEbWKEIOFi3QCu8trsnv8jWGNGBlL+C1dEz3jdWAI96i3YeuZcSoKhI2hHeGUZO/LwzM=;
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1udevs-0003M6-Em for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 01:03:08 +0000
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-87f32826f22so5254304241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Jul 2025 18:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753059777; x=1753664577; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=;
 b=k4I+ipHKZj0ezraUpwA2thTfG+bu6STtdQJw7MkIJ2/iSrxLcGq2KX5nGhjbQluyOc
 Pe0xXn6GDTFp/HNOLQNIp/u28AtfXy2z6yUJmp6NyuNgfnbUcWZT5HO+GL2KkfSd++e/
 0+wKrLj9KpgOY1c2o6UFyk2gbTIn77SXM9/A7e2NvKscp7r9jb6fqUcv9z9pjivXL7gC
 3iqqPMQQhkNp+Jb2Zh3PQLZeQQyXWpuhO8Z2dI00qJiuKckPYLL2RQ6bUntuKIJTGb69
 H3OKhX8iricrNRCZS0rLdZ8Hmqzq8PzNbBYe4MOGwB5sy3SyjT/VSHitJ7hrhNg+WAOc
 N1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753059777; x=1753664577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUWA5dQohEpiNzIiLQ5yB5KcDd7NwkYx6hF+GZtItHM=;
 b=TDpgOGwr5ms/nDI3C7yq5DlKiRIeOX/y36nqladk7KL+rRv9c7WTnYh7lo+upJlmvf
 SebU5wSPjvdGslnDPCp3uT6RcK24JRBtTZgqWFxYUzlr5SuNzcBXR/JQUDsxiHv397PF
 54kOzIAmO+LZsy3+aM91S+TVE+/XJtt2VX0Ypa+B7mHoxzxQFKvMQAP95lrIlNHp9f/T
 sQs7l4ujFjv7bR6K8bATngoeh+E9b8prNj/qcbqze1Ygo1fLdgUsziTbY0eA0OeNp5mu
 tCPOXimc7uHa4U5WQ/7uZLQhj7xEvJoQgOLO4fdtdWSrfmFsUg/yefSftenKsHkGLgwN
 ORMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH/77d/VIb/ETvoIUH7IZTL8OMG4WM2rIH0F2sTvYKsk5ktCRcotWl/UznLzV4fNSrEzzkByXHKxaC9GHyXtmC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxYwjkPJg1NavcGpqu8TgVvmtjvfXq+X7VcSqempFGuTvji64fE
 PLY7XMTPjupp3LPdCRPCc4QSeAJIWWAhpNeOqf+eBIn7aeHvU8hWJm/xdDFzROnDN1YBW/8LVdS
 tYH3XHx+Xz2TaqbEGoJQVk/1TUC1fumM=
X-Gm-Gg: ASbGncv4uRQiCF4UXyYzJENgcxWwpR81T1s2rx2XTWNr2XrlpoMlbcVksrOXbvvk0Gd
 smDiy3rC5lbRT9LTyaLM/GcR9JQcaykeuQls5Nzx2JenmfVewVkvWOGdb61+8Wyci3DSuE0dOX0
 +0zBSme59GS71F4+CduYwGFVev+P0TLyS5ODPc7q0ViK5qFvj8QaiOdMAndbJXGS6KaA2Y1gSMC
 t6Lsmk=
X-Google-Smtp-Source: AGHT+IEmfqw92aWBN5S+l0I76SU0igPCpvqCsAsKehe4/Ig+tf7XCtcGuzfl8boXl3T7O5lTenPtedOe1kc4xTvXkm8=
X-Received: by 2002:a05:6102:30c8:10b0:4e9:9221:46d5 with SMTP id
 ada2fe7eead31-4f9a863ff9fmr3911618137.3.1753059777443; Sun, 20 Jul 2025
 18:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
In-Reply-To: <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 09:02:45 +0800
X-Gm-Features: Ac12FXxvyCQ0eeZOJnljUPiNW1hOMFbnyUUqpvxURHtPLurlhEFVPbwv81doELM
Message-ID: <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 16, 2025 at 8:28 AM Gao Xiang wrote: > > > > On
 2025/7/16 07:32, Gao Xiang wrote: > > Hi Matthew, > > > > On 2025/7/16 04:40, 
 Matthew Wilcox wrote: > >> I've started looking at how the p [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.49 listed in wl.mailspike.net]
X-Headers-End: 1udevs-0003M6-Em
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-cifs@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Matthew Wilcox <willy@infradead.org>,
 Gao Xiang <xiang@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Hailong Liu <hailong.liu@oppo.com>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMDI1LzcvMTYgMDc6MzIsIEdhbyBY
aWFuZyB3cm90ZToKPiA+IEhpIE1hdHRoZXcsCj4gPgo+ID4gT24gMjAyNS83LzE2IDA0OjQwLCBN
YXR0aGV3IFdpbGNveCB3cm90ZToKPiA+PiBJJ3ZlIHN0YXJ0ZWQgbG9va2luZyBhdCBob3cgdGhl
IHBhZ2UgY2FjaGUgY2FuIGhlbHAgZmlsZXN5c3RlbXMgaGFuZGxlCj4gPj4gY29tcHJlc3NlZCBk
YXRhIGJldHRlci4gIEZlZWRiYWNrIHdvdWxkIGJlIGFwcHJlY2lhdGVkISAgSSdsbCBwcm9iYWJs
eQo+ID4+IHNheSBhIGZldyB0aGluZ3Mgd2hpY2ggYXJlIG9idmlvdXMgdG8gYW55b25lIHdobyBr
bm93cyBob3cgY29tcHJlc3NlZAo+ID4+IGZpbGVzIHdvcmssIGJ1dCBJJ20gdHJ5aW5nIHRvIGJl
IGV4cGxpY2l0IGFib3V0IG15IGFzc3VtcHRpb25zLgo+ID4+Cj4gPj4gRmlyc3QsIEkgYmVsaWV2
ZSB0aGF0IGFsbCBmaWxlc3lzdGVtcyB3b3JrIGJ5IGNvbXByZXNzaW5nIGZpeGVkLXNpemUKPiA+
PiBwbGFpbnRleHQgaW50byB2YXJpYWJsZS1zaXplZCBjb21wcmVzc2VkIGJsb2Nrcy4gIFRoaXMg
d291bGQgYmUgYSBnb29kCj4gPj4gcG9pbnQgdG8gc3RvcCByZWFkaW5nIGFuZCB0ZWxsIG1lIGFi
b3V0IGNvdW50ZXJleGFtcGxlcy4KPiA+Cj4gPiBBdCBsZWFzdCB0aGUgdHlwaWNhbCBFUk9GUyBj
b21wcmVzc2VzIHZhcmlhYmxlLXNpemVkIHBsYWludGV4dCAoYXQgbGVhc3QKPiA+IG9uZSBibG9j
aywgZS5nLiA0aywgYnV0IGFsc28gNGsrMSwgNGsrMiwgLi4uKSBpbnRvIGZpeGVkLXNpemVkIGNv
bXByZXNzZWQKPiA+IGJsb2NrcyBmb3IgZWZmaWNpZW50IEkvT3MsIHdoaWNoIGlzIHJlYWxseSB1
c2VmdWwgZm9yIHNtYWxsIGNvbXByZXNzaW9uCj4gPiBncmFudWxhcml0eSAoZS5nLiA0S2lCLCA4
S2lCKSBiZWNhdXNlIHVzZSBjYXNlcyBsaWtlIEFuZHJvaWQgYXJlIHVzdWFsbHkKPiA+IHVuZGVy
IG1lbW9yeSBwcmVzc3VyZSBzbyBsYXJnZSBjb21wcmVzc2lvbiBncmFudWxhcml0eSBpcyBhbG1v
c3QKPiA+IHVuYWNjZXB0YWJsZSBpbiB0aGUgbG93IG1lbW9yeSBzY2VuYXJpb3MsIHNlZToKPiA+
IGh0dHBzOi8vZXJvZnMuZG9jcy5rZXJuZWwub3JnL2VuL2xhdGVzdC9kZXNpZ24uaHRtbAo+ID4K
PiA+IEN1cnJlbnRseSBFUk9GUyB3b3JrcyBwcmV0dHkgd2VsbCBvbiB0aGVzZSBkZXZpY2VzIGFu
ZCBoYXMgYmVlbgo+ID4gc3VjY2Vzc2Z1bGx5IGRlcGxveWVkIGluIGJpbGxpb25zIG9mIHJlYWwg
ZGV2aWNlcy4KPiA+Cj4gPj4KPiA+PiAgRnJvbSB3aGF0IEkndmUgYmVlbiByZWFkaW5nIGluIGFs
bCB5b3VyIGZpbGVzeXN0ZW1zIGlzIHRoYXQgeW91IHdhbnQgdG8KPiA+PiBhbGxvY2F0ZSBleHRy
YSBwYWdlcyBpbiB0aGUgcGFnZSBjYWNoZSBpbiBvcmRlciB0byBzdG9yZSB0aGUgZXhjZXNzIGRh
dGEKPiA+PiByZXRyaWV2ZWQgYWxvbmcgd2l0aCB0aGUgcGFnZSB0aGF0IHlvdSdyZSBhY3R1YWxs
eSB0cnlpbmcgdG8gcmVhZC4gIFRoYXQncwo+ID4+IGJlY2F1c2UgY29tcHJlc3NpbmcgaW4gbGFy
Z2VyIGNodW5rcyBsZWFkcyB0byBiZXR0ZXIgY29tcHJlc3Npb24uCj4gPj4KPiA+PiBUaGVyZSdz
IHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHlvdSBuZWVkIHNj
cmF0Y2gKPiA+PiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi4gIFNvbWUgZmlsZXN5c3RlbXMgcmVh
ZCB0aGUgY29tcHJlc3NlZCBkYXRhIGludG8KPiA+PiB0aGUgcGFnZWNhY2hlIGFuZCBkZWNvbXBy
ZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBmaWxlc3lzdGVtcyByZWFkIHRoZQo+ID4+IGNvbXBy
ZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3MgaW50byB0aGUgcGFn
ZSBjYWNoZS4KPiA+Pgo+ID4+IFRoZXJlIGFsc28gc2VlbXMgdG8gYmUgc29tZSBkaXNjcmVwYW5j
eSBiZXR3ZWVuIGZpbGVzeXN0ZW1zIHdoZXRoZXIgdGhlCj4gPj4gZGVjb21wcmVzc2lvbiBpbnZv
bHZlcyB2bWFwKCkgb2YgYWxsIHRoZSBtZW1vcnkgYWxsb2NhdGVkIG9yIHdoZXRoZXIgdGhlCj4g
Pj4gZGVjb21wcmVzc2lvbiByb3V0aW5lcyBjYW4gaGFuZGxlIGRvaW5nIGttYXBfbG9jYWwoKSBv
biBpbmRpdmlkdWFsIHBhZ2VzLgo+ID4+Cj4gPj4gU28sIG15IHByb3Bvc2FsIGlzIHRoYXQgZmls
ZXN5c3RlbXMgdGVsbCB0aGUgcGFnZSBjYWNoZSB0aGF0IHRoZWlyIG1pbmltdW0KPiA+PiBmb2xp
byBzaXplIGlzIHRoZSBjb21wcmVzc2lvbiBibG9jayBzaXplLiAgVGhhdCBzZWVtcyB0byBiZSBh
cm91bmQgNjRrLAo+ID4+IHNvIG5vdCBhbiB1bnJlYXNvbmFibGUgbWluaW11bSBhbGxvY2F0aW9u
IHNpemUuICBUaGF0IHJlbW92ZXMgYWxsIHRoZQo+ID4+IGV4dHJhIGNvZGUgaW4gZmlsZXN5c3Rl
bXMgdG8gYWxsb2NhdGUgZXh0cmEgbWVtb3J5IGluIHRoZSBwYWdlIGNhY2hlLj4gSXQgbWVhbnMg
d2UgZG9uJ3QgYXR0ZW1wdCB0byB0cmFjayBkaXJ0aW5lc3MgYXQgYSBzdWItZm9saW8gZ3JhbnVs
YXJpdHkKPiA+PiAodGhlcmUncyBubyBwb2ludCwgd2UgaGF2ZSB0byB3cml0ZSBiYWNrIHRoZSBl
bnRpcmUgY29tcHJlc3NlZCBib2NrCj4gPj4gYXQgb25jZSkuICBXZSBhbHNvIGdldCBhIHNpbmds
ZSB2aXJ0dWFsbHkgY29udGlndW91cyBibG9jayAuLi4gaWYgeW91J3JlCj4gPj4gd2lsbGluZyB0
byBkaXRjaCBISUdITUVNIHN1cHBvcnQuICBPciB0aGVyZSdzIGEgcHJvcG9zYWwgdG8gaW50cm9k
dWNlIGEKPiA+PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVzIGEgdmlydHVhbGx5IGNv
bnRpZ3VvdXMgY2h1bmsgb2YgbWVtb3J5Cj4gPj4gKGFuZCBjb3VsZCBiZSB0cml2aWFsbHkgdHVy
bmVkIGludG8gYSBub29wIGZvciB0aGUgY2FzZSBvZiB0cnlpbmcgdG8KPiA+PiB2bWFwIGEgc2lu
Z2xlIGxhcmdlIGZvbGlvKS4KPiA+Cj4gPiBJIGRvbid0IHNlZSB0aGlzIHdpbGwgd29yayBmb3Ig
RVJPRlMgYmVjYXVzZSBFUk9GUyBhbHdheXMgc3VwcG9ydHMKPiA+IHZhcmlhYmxlIHVuY29tcHJl
c3NlZCBleHRlbnQgbGVuZ3RocyBhbmQgdGhhdCB3aWxsIGJyZWFrIHR5cGljYWwKPiA+IEVST0ZT
IHVzZSBjYXNlcyBhbmQgb24tZGlzayBmb3JtYXRzLgo+ID4KPiA+IE90aGVyIHRoaW5nIGlzIHRo
YXQgbGFyZ2Ugb3JkZXIgZm9saW9zIChwaHlzaWNhbCBjb25zZWN1dGl2ZSkgd2lsbAo+ID4gY2F1
c2VkICJpbmNyZWFzZSB0aGUgbGF0ZW5jeSBvbiBVWCB0YXNrIHdpdGggZmlsZW1hcF9mYXVsdCgp
Igo+ID4gYmVjYXVzZSBvZiBoaWdoLW9yZGVyIGRpcmVjdCByZWNsYWltcywgc2VlOgo+ID4gaHR0
cHM6Ly9hbmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mva2VybmVsL2NvbW1vbi8rLzM2
OTIzMzMKPiA+IHNvIEVST0ZTIHdpbGwgbm90IHNldCBtaW4tb3JkZXIgYW5kIGFsd2F5cyBzdXBw
b3J0IG9yZGVyLTAgZm9saW9zLgo+ID4KPiA+IEkgdGhpbmsgRVJPRlMgd2lsbCBub3QgdXNlIHRo
aXMgbmV3IGFwcHJvYWNoLCB2bWFwKCkgaW50ZXJmYWNlIGlzCj4gPiBhbHdheXMgdGhlIGNhc2Ug
Zm9yIHVzLgo+Cj4gLi4uIGhpZ2gtb3JkZXIgZm9saW9zIGNhbiBjYXVzZSBzaWRlIGVmZmVjdHMg
b24gZW1iZWRkZWQgZGV2aWNlcwo+IGxpa2Ugcm91dGVycyBhbmQgSW9UIGRldmljZXMsIHdoaWNo
IHN0aWxsIGhhdmUgTWlCcyBvZiBtZW1vcnkgKGFuZCBJCj4gYmVsaWV2ZSB0aGlzIHdvbid0IGNo
YW5nZSBkdWUgdG8gdGhlaXIgdXNlIGNhc2VzKSBidXQgdGhleSBhbHNvIHVzZQo+IExpbnV4IGtl
cm5lbCBmb3IgcXVpdGUgbG9uZyB0aW1lLiAgSW4gc2hvcnQsIEkgZG9uJ3QgdGhpbmsgZW5hYmxp
bmcKPiBsYXJnZSBmb2xpb3MgZm9yIHRob3NlIGRldmljZXMgaXMgdmVyeSB1c2VmdWwsIGxldCBh
bG9uZSBsaW1pdGluZwo+IHRoZSBtaW5pbXVtIGZvbGlvIG9yZGVyIGZvciB0aGVtIChJdCB3b3Vs
ZCBtYWtlIHRoZSBmaWxlc3lzdGVtIG5vdAo+IHN1aXRhYmxlIGFueSBtb3JlIGZvciB0aG9zZSB1
c2Vycy4gIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJIG5ldmVyCj4gd2FudCB0byBkbykuICBBbmQg
SSBiZWxpZXZlIHRoaXMgaXMgZGlmZmVyZW50IGZyb20gdGhlIGN1cnJlbnQgTEJTCj4gc3VwcG9y
dCB0byBtYXRjaCBoYXJkd2FyZSBjaGFyYWN0ZXJpc3RpY3Mgb3IgTEJTIGF0b21pYyB3cml0ZQo+
IHJlcXVpcmVtZW50LgoKR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBm
b2xpb3MsIGl0J3MgYWx3YXlzIGEgZ29vZAppZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxi
YWNrLiBXaGlsZSBJIGFncmVlIHdpdGggeW91ciBwb2ludCwKSSBoYXZlIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCnRob3NlIGRl
dmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNob3VsZApy
ZW1haW4gc21hbGwuIEknbSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCgpTdGls
bCwgZXZlbiB3aXRoIHRob3NlLCBhbGxvY2F0aW9uIGNhbiBiZSBkaWZmaWN1bHQg4oCUIGVzcGVj
aWFsbHkKc2luY2Ugc28gbWFueSBvdGhlciBhbGxvY2F0aW9ucyAod2hpY2ggYXJlbid0IGxhcmdl
IGZvbGlvcykgY2FuIGNhdXNlCmZyYWdtZW50YXRpb24uIFNvIGhhdmluZyBvcmRlci0wIGFzIGEg
ZmFsbGJhY2sgcmVtYWlucyBpbXBvcnRhbnQuCgpJdCBzZWVtcyB3ZSdyZSBtaXNzaW5nIGEgbWVj
aGFuaXNtIHRvIGVuYWJsZSAic21hbGwiIGxhcmdlIGZvbGlvcwpmb3IgZmlsZXMuIEZvciBhbm9u
IGxhcmdlIGZvbGlvcywgd2UgZG8gaGF2ZSBzeXNmcyBrbm9ic+KAlHRob3VnaCB0aGV5CmRvbuKA
mXQgc2VlbSB0byBiZSB1bml2ZXJzYWxseSBhcHByZWNpYXRlZC4gOi0pCgpUaGFua3MKQmFycnkK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
