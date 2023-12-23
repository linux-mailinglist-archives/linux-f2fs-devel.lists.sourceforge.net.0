Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F081D2A8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Dec 2023 07:20:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGvNE-0007Yz-TE;
	Sat, 23 Dec 2023 06:20:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1rGvND-0007Ys-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 06:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3swqIpA3Pn1kI9NI9NJCq9zWAp1pO/v0osTwtHc8TM=; b=bus08ZbQqBav1EYIMFMrR865Qi
 NqjZvj/3dsdTynDhHgAgJe5nMrGvWRdID/NBsgAt6H7QixZy6nIRmT6PB0xccNDatABrRi5L6R078
 ASSPmkyajLyy1bx0XT+kgthGfNS6y+6O9C/w27QFzUD7FcY9YWunsG4iUs5gN1upx9qU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j3swqIpA3Pn1kI9NI9NJCq9zWAp1pO/v0osTwtHc8TM=; b=RaZfb0YwMRbKQA6apZ9Gc/Nj3b
 LCixKh30UUMwdjOh1jieHrpFKhXRMAVwUF2wUiOJAPICRlXfSXBX0qksCA3KFYMkn4L/jc0K12ccg
 Xnnk2HOmzxVFlX/Dq3iWZmRwPssEfWag1+szsp+ZdBDc9OqN1lcl+NMNDViNxWWU9Zow=;
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rGvNA-0003eK-HG for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Dec 2023 06:20:34 +0000
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-67f7bd86cafso16981866d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Dec 2023 22:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703312421; x=1703917221; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3swqIpA3Pn1kI9NI9NJCq9zWAp1pO/v0osTwtHc8TM=;
 b=Zld6iMhNUHB4CcTAiSco2xtPt2e8MpfkU51iF86T7PiNQAmfHbCKj3E++KGGfa4soc
 0hs1wH9uSZ7WnKGwz1bfWcX4CCuaE1Gv6BGf6GRxRg/+INRNOgB7glfgvvH37mDocdWw
 Ytzcr1j1cg914bvbor2Znzv1d6Ems85j7x9dLy/afJsvEygoLN0HsmXxVxARpBSERIv3
 iRKiLycMRqnzM29lK1NV7pG3Feuc4+VpKLHV6f9Qc4ZvmwkfCT9pgNf3Bv6nqSHl8n+d
 ZOefTTFTwS8yLBh1Q1MFbgvEeOcDliAya+sqHQNA/D+KwDUauu2sxGB4MJIunH7bcR8R
 Hikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703312421; x=1703917221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3swqIpA3Pn1kI9NI9NJCq9zWAp1pO/v0osTwtHc8TM=;
 b=s65ROgX7YcQQFRbNW5lUtL4OoKKH4aSdzSeALF6ymLUbbLZc0iHmoNohtVARN1/qWj
 6h5i9akTx/BdR6JV+qwRhms5yr8G0KvgAbuvlcGroBWwooGCLtX9ti956wTBNT/PQ0SA
 B2cXyUoKyCPQk7JtoI2msgz+BSsvcAeqwycjeOvEo3DuXWOmmqaSbQGmAN1+xaghVkZK
 vuqigih8CdPMUcmpsOqv1g1fNbQsiLQOXJXq/IMAZWrWvEDdvUThcD1W16k68vUQzSZO
 pN4gXSjN8Jj3mwzkxCOgOwGk312LBRne3n/CBJRlV7mn2IM8A5Blij/G/4SS8PhbhnOS
 WBbA==
X-Gm-Message-State: AOJu0YwKJXhDg73fhQlft1yXOu47wUACkkvN46Y10liep3BvGAiv0a9n
 pfkQMZg+bd9zYoSRVihzMRS+IfqCPqqrcxsGbKvvtvJXCaA=
X-Google-Smtp-Source: AGHT+IGX+1U3ybuq14sXkiiR2hbRazhcHZ5cQy0wNNwdfonLJ7hFI9WplhjO0FnabReCR3nqtqcPt6rG7Cg5QVkujvI=
X-Received: by 2002:ad4:558f:0:b0:67f:aec9:6929 with SMTP id
 f15-20020ad4558f000000b0067faec96929mr706549qvx.71.1703312421122; Fri, 22 Dec
 2023 22:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20231215211608.6449-1-krisman@suse.de>
 <20231219231222.GI38652@quark.localdomain>
 <87a5q1eecy.fsf_-_@mailhost.krisman.be>
In-Reply-To: <87a5q1eecy.fsf_-_@mailhost.krisman.be>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 23 Dec 2023 08:20:09 +0200
Message-ID: <CAOQ4uxjhWPB6W+EFyuE-eYbLHehOGRLSfs6K62+h8-f9izJG-A@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@suse.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Dec 23, 2023 at 6:23 AM Gabriel Krisman Bertazi
   wrote: > > Eric Biggers writes: > > > On Fri, Dec 15, 2023 at 04:16:00PM -0500,
    Gabriel Krisman Bertazi wrote: > >> [Apologies for the qui [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.51 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGvNA-0003eK-HG
Subject: Re: [f2fs-dev] [PATCH] ovl: Reject mounting case-insensitive
 filesystems
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgNjoyM+KAr0FNIEdhYnJpZWwgS3Jpc21hbiBCZXJ0YXpp
IDxrcmlzbWFuQHN1c2UuZGU+IHdyb3RlOgo+Cj4gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJu
ZWwub3JnPiB3cml0ZXM6Cj4KPiA+IE9uIEZyaSwgRGVjIDE1LCAyMDIzIGF0IDA0OjE2OjAwUE0g
LTA1MDAsIEdhYnJpZWwgS3Jpc21hbiBCZXJ0YXppIHdyb3RlOgo+ID4+IFtBcG9sb2dpZXMgZm9y
IHRoZSBxdWljayBzcGluIG9mIGEgdjIuICBUaGUgb25seSBkaWZmZXJlbmNlIGFyZSBhIGNvdXBs
ZQo+ID4+IGZpeGVzIHRvIHRoZSBidWlsZCB3aGVuIENPTkZJR19VTklDT0RFPW4gY2F1Z2h0IGJ5
IExLUCBhbmQgZGV0YWlsZWQgaW4KPiA+PiBlYWNoIHBhdGNoIGNoYW5nZWxvZy5dCj4gPj4KPiA+
PiBXaGVuIGNhc2UtaW5zZW5zaXRpdmUgYW5kIGZzY3J5cHQgd2VyZSBhZGFwdGVkIHRvIHdvcmsg
dG9nZXRoZXIsIHdlIG1vdmVkIHRoZQo+ID4+IGNvZGUgdGhhdCBzZXRzIHRoZSBkZW50cnkgb3Bl
cmF0aW9ucyBmb3IgY2FzZS1pbnNlbnNpdGl2ZSBkZW50cmllcyhkX2hhc2ggYW5kCj4gPj4gZF9j
b21wYXJlKSB0byBoYXBwZW4gZnJvbSBhIGhlbHBlciBpbnNpZGUgLT5sb29rdXAuICBUaGlzIGlz
IGJlY2F1c2UgZnNjcnlwdAo+ID4+IHdhbnRzIHRvIHNldCBkX3JldmFsaWRhdGUgb25seSBvbiBz
b21lIGRlbnRyaWVzLCBzbyBpdCBkb2VzIGl0IG9ubHkgZm9yIHRoZW0gaW4KPiA+PiBkX3JldmFs
aWRhdGUuCj4gPj4KPiA+PiBCdXQsIGNhc2UtaW5zZW5zaXRpdmUgaG9va3MgYXJlIGFjdHVhbGx5
IHNldCBvbiBhbGwgZGVudHJpZXMgaW4gdGhlIGZpbGVzeXN0ZW0sCj4gPj4gc28gdGhlIG5hdHVy
YWwgcGxhY2UgdG8gZG8gaXQgaXMgdGhyb3VnaCBzX2Rfb3AgYW5kIGxldCBkX2FsbG9jIGhhbmRs
ZSBpdCBbMV0uCj4gPj4gSW4gYWRkaXRpb24sIGRvaW5nIGl0IGluc2lkZSB0aGUgLT5sb29rdXAg
aXMgYSBwcm9ibGVtIGZvciBjYXNlLWluc2Vuc2l0aXZlCj4gPj4gZGVudHJpZXMgdGhhdCBhcmUg
bm90IGNyZWF0ZWQgdGhyb3VnaCAtPmxvb2t1cCwgbGlrZSB0aG9zZSBjb21pbmcKPiA+PiBvcGVu
LWJ5LWZoYW5kbGVbMl0sIHdoaWNoIHdpbGwgbm90IHNlZSB0aGUgcmVxdWlyZWQgZF9vcHMuCj4g
Pj4KPiA+PiBUaGlzIHBhdGNoc2V0IHRoZXJlZm9yZSByZXZlcnRzIHRvIHVzaW5nIHNiLT5zX2Rf
b3AgdG8gc2V0IHRoZSBkZW50cnkgb3BlcmF0aW9ucwo+ID4+IGZvciBjYXNlLWluc2Vuc2l0aXZl
IGZpbGVzeXN0ZW1zLiAgSW4gb3JkZXIgdG8gc2V0IGNhc2UtaW5zZW5zaXRpdmUgaG9va3MgZWFy
bHkKPiA+PiBhbmQgbm90IHJlcXVpcmUgZXZlcnkgZGVudHJ5IHRvIGhhdmUgZF9yZXZhbGlkYXRl
IGluIGNhc2UtaW5zZW5zaXRpdmUKPiA+PiBmaWxlc3lzdGVtcywgaXQgaW50cm9kdWNlcyBhIHBh
dGNoIHN1Z2dlc3RlZCBieSBBbCBWaXJvIHRvIGRpc2FibGUgZF9yZXZhbGlkYXRlCj4gPj4gb24g
c29tZSBkZW50cmllcyBvbiB0aGUgZmx5Lgo+ID4+Cj4gPj4gSXQgc3Vydml2ZXMgZnN0ZXN0cyBl
bmNyeXB0IGFuZCBxdWljayBncm91cHMgd2l0aG91dCByZWdyZXNzaW9ucy4gIEJhc2VkIG9uCj4g
Pj4gdjYuNy1yYzEuCj4gPj4KPiA+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZnNkZXZlbC8yMDIzMTEyMzE5NTMyNy5HUDM4MTU2QFplbklWLwo+ID4+IFsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjMxMTIzMTcxMjU1LkdOMzgxNTZAWmVuSVYv
Cj4gPj4KPiA+PiBHYWJyaWVsIEtyaXNtYW4gQmVydGF6aSAoOCk6Cj4gPj4gICBkY2FjaGU6IEFk
ZCBoZWxwZXIgdG8gZGlzYWJsZSBkX3JldmFsaWRhdGUgZm9yIGEgc3BlY2lmaWMgZGVudHJ5Cj4g
Pj4gICBmc2NyeXB0OiBEcm9wIGRfcmV2YWxpZGF0ZSBpZiBrZXkgaXMgYXZhaWxhYmxlCj4gPj4g
ICBsaWJmczogTWVyZ2UgZW5jcnlwdGVkX2NpX2RlbnRyeV9vcHMgYW5kIGNpX2RlbnRyeV9vcHMK
PiA+PiAgIGxpYmZzOiBFeHBvc2UgZ2VuZXJpY19jaV9kZW50cnlfb3BzIG91dHNpZGUgb2YgbGli
ZnMKPiA+PiAgIGV4dDQ6IFNldCB0aGUgY2FzZS1pbnNlbnNpdGl2ZSBkZW50cnkgb3BlcmF0aW9u
cyB0aHJvdWdoIC0+c19kX29wCj4gPj4gICBmMmZzOiBTZXQgdGhlIGNhc2UtaW5zZW5zaXRpdmUg
ZGVudHJ5IG9wZXJhdGlvbnMgdGhyb3VnaCAtPnNfZF9vcAo+ID4+ICAgbGliZnM6IERvbid0IHN1
cHBvcnQgc2V0dGluZyBjYXNlZm9sZCBvcGVyYXRpb25zIGR1cmluZyBsb29rdXAKPiA+PiAgIGZz
Y3J5cHQ6IE1vdmUgZF9yZXZhbGlkYXRlIGNvbmZpZ3VyYXRpb24gYmFjayBpbnRvIGZzY3J5cHQK
PiA+Cj4gPiBUaGFua3MgR2FicmllbCwgdGhpcyBzZXJpZXMgbG9va3MgZ29vZC4gIFNvcnJ5IHRo
YXQgd2UgbWlzc2VkIHRoaXMgd2hlbiBhZGRpbmcKPiA+IHRoZSBzdXBwb3J0IGZvciBlbmNyeXB0
K2Nhc2Vmb2xkLgo+ID4KPiA+IEl0J3Mgc2xpZ2h0bHkgYXdrd2FyZCB0aGF0IHNvbWUgbGluZXMg
b2YgY29kZSBhZGRlZCBieSBwYXRjaGVzIDUtNiBhcmUgcmVtb3ZlZAo+ID4gaW4gcGF0Y2ggOC4g
IFRoZXNlIGNoYW5nZXMgbG9vayB2ZXJ5IGhhcmQgdG8gc3BsaXQgdXAsIHRob3VnaCwgc28geW91
J3ZlCj4gPiBwcm9iYWJseSBkb25lIGFib3V0IHRoZSBiZXN0IHRoYXQgY2FuIGJlIGRvbmUuCj4g
Pgo+ID4gT25lIHF1ZXN0aW9uL3JlcXVlc3Q6IGJlc2lkZXMgcGVyZm9ybWFuY2UsIHRoZSBvdGhl
ciByZWFzb24gd2UncmUgc28gY2FyZWZ1bAo+ID4gYWJvdXQgbWluaW1pemluZyB3aGVuIC0+ZF9y
ZXZhbGlkYXRlIGlzIHNldCBmb3IgZnNjcnlwdCBpcyBzbyB0aGF0IG92ZXJsYXlmcwo+ID4gd29y
a3Mgb24gZW5jcnlwdGVkIGRpcmVjdG9yaWVzLiAgVGhpcyBpcyBiZWNhdXNlIG92ZXJsYXlmcyBp
cyBub3QgY29tcGF0aWJsZQo+ID4gd2l0aCAtPmRfcmV2YWxpZGF0ZS4gIEkgdGhpbmsgeW91ciBz
b2x1dGlvbiBzdGlsbCB3b3JrcyBmb3IgdGhhdCwgc2luY2UKPiA+IERDQUNIRV9PUF9SRVZBTElE
QVRFIHdpbGwgYmUgY2xlYXJlZCBhZnRlciB0aGUgZmlyc3QgY2FsbCB0bwo+ID4gZnNjcnlwdF9k
X3JldmFsaWRhdGUoKSwgYW5kIHdoZW4gY2hlY2tpbmcgZm9yIHVzdXBwb3J0ZWQgZGVudHJpZXMg
b3ZlcmxheWZzIGRvZXMKPiA+IGluZGVlZCBjaGVjayBmb3IgRENBQ0hFX09QX1JFVkFMSURBVEUg
aW5zdGVhZCBvZiAtPmRfcmV2YWxpZGF0ZSBkaXJlY3RseS4KPiA+IEhvd2V2ZXIsIHRoYXQgZG9l
cyByZWx5IG9uIHRoYXQgdmVyeSBmaXJzdCBjYWxsIHRvIC0+ZF9yZXZhbGlkYXRlIGFjdHVhbGx5
Cj4gPiBoYXBwZW5pbmcgYmVmb3JlIHRoZSBjaGVjayBpcyBkb25lLiAgSXQgd291bGQgYmUgbmlj
ZSB0byB2ZXJpZnkgdGhhdAo+ID4gb3ZlcmxheWZzK2ZzY3J5cHQgaW5kZWVkIGNvbnRpbnVlcyB0
byB3b3JrLCBhbmQgZXhwbGljaXRseSBtZW50aW9uIHRoaXMKPiA+IHNvbWV3aGVyZSAoSSBkb24n
dCBzZWUgYW55IG1lbnRpb24gb2Ygb3ZlcmxheWZzK2ZzY3J5cHQgaW4gdGhlIHNlcmllcykuCj4K
PiBIaSBFcmljLAo+Cj4gRnJvbSBteSB0ZXN0aW5nLCBvdmVybGF5ZnMrZnNjcnlwdCBzaG91bGQg
d29yayBmaW5lLiAgSSB0cmllZCBtb3VudGluZwo+IGl0IG9uIHRvcCBvZiBlbmNyeXB0ZWQgZGly
ZWN0b3JpZXMsIHdpdGggYW5kIHdpdGhvdXQga2V5LCBhbmQgd2lsbCBhZGQKPiB0aGlzIGluZm9y
bWF0aW9uIHRvIHRoZSBjb21taXQgbWVzc2FnZS4gIElmIHdlIGFkb3B0IHRoZSBzdWdnZXN0aW9u
IGZyb20KPiBBbCBpbiB0aGUgb3RoZXIgc3VidGhyZWFkLCBldmVuIGJldHRlciwgd2Ugd29uJ3Qg
bmVlZCB0aGUgZmlyc3QKPiBkX3JldmFsaWRhdGUgdG8gaGFwcGVuIGJlZm9yZSB0aGUgY2hlY2ss
IHNvIEknbGwgYWRvcHQgdGhhdC4KPgo+IFdoaWxlIGxvb2tpbmcgaW50byBvdmVybGF5ZnMsIEkg
Zm91bmQgYW5vdGhlciByZWFzb24gd2Ugd291bGQgbmVlZCB0aGlzCj4gcGF0Y2hzZXQuICBBIHNp
ZGUgZWZmZWN0IG9mIG5vdCBjb25maWd1cmluZyAtPmRfb3AgdGhyb3VnaCBzX2Rfb3AgaXMKPiB0
aGF0IHRoZSByb290IGRlbnRyeSB3b24ndCBoYXZlIGRfb3Agc2V0LiAgV2hpbGUgdGhpcyBpcyBm
aW5lIGZvcgo+IGNhc2Vmb2xkLCBiZWNhdXNlIHdlIGZvcmJpZCB0aGUgcm9vdCBkaXJlY3Rvcnkg
ZnJvbSBiZWluZwo+IGNhc2UtaW5zZW5zaXRpdmUsIHdlIGNhbiB0cmljayBvdmVybGF5ZnMgaW50
byBtb3VudGluZyBhCj4gZmlsZXN5c3RlbSBpdCBjYW4ndCBoYW5kbGUuCj4KPiBFdmVuIHdpdGgg
dGhpcyBtZXJnZWQsIGFuZCBhcyBDaHJpc3RpYW4gc2FpZCBpbiBhbm90aGVyIHRocmVhZCByZWdh
cmRpbmcKPiBlY3J5cHRmcywgd2Ugc2hvdWxkIGhhbmRsZSB0aGlzIGV4cGxpY2l0bHkuICBTb21l
dGhpbmcgbGlrZSBiZWxvdy4KPgo+IEFtaXIsIHdvdWxkIHlvdSBjb25zaWRlciB0aGlzIGZvciAt
cmM4PwoKSUlVQywgdGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24gZnJvbSB2NS4xMCB3aXRoIGEgdmVy
eSBsb3cgbGlrZWxpaG9vZCBvZgppbXBhY3Qgb24gYW55b25lIGluIHRoZSByZWFsIHdvcmxkLCBz
byB3aGF0J3MgdGhlIHJ1c2g/Ckkgd291bGQgcmF0aGVyIHRoYXQgeW91IHNlbmQgdGhpcyBmaXgg
YWxvbmcgd2l0aCB5b3VyIHBhdGNoIHNldC4KCkZlZWwgZnJlZSB0byBhZGQ6CgpBY2tlZC1ieTog
QW1pciBHb2xkc3RlaW4gPGFtaXI3M2lsQGdtYWlsLmNvbT4KCmFmdGVyIGZpeGluZyBuaXRzIGJl
bG93Cgo+Cj4gLS0gPjggLS0KPiBTdWJqZWN0OiBbUEFUQ0hdIG92bDogUmVqZWN0IG1vdW50aW5n
IGNhc2UtaW5zZW5zaXRpdmUgZmlsZXN5c3RlbXMKPgo+IG92ZXJsYXlmcyByZWxpZXMgb24gdGhl
IGZpbGVzeXN0ZW0gc2V0dGluZyBEQ0FDSEVfT1BfSEFTSCBvcgo+IERDQUNIRV9PUF9DT01QQVJF
IHRvIHJlamVjdCBtb3VudGluZyBvdmVyIGNhc2UtaW5zZW5zaXRpdmUgZGlyZWN0b3JpZXMuCj4K
PiBTaW5jZSBjb21taXQgYmI5Y2Q5MTA2YjIyICgiZnNjcnlwdDogSGF2ZSBmaWxlc3lzdGVtcyBo
YW5kbGUgdGhlaXIKPiBkX29wcyIpLCB3ZSBzZXQgLT5kX29wIHRocm91Z2ggYSBob29rIGluIC0+
ZF9sb29rdXAsIHdoaWNoCj4gbWVhbnMgdGhlIHJvb3QgZGVudHJ5IHdvbid0IGhhdmUgdGhlbSwg
Y2F1c2luZyB0aGUgbW91bnQgdG8gYWNjaWRlbnRhbGx5Cj4gc3VjY2VlZC4KPgo+IEluIHY2Ljct
cmM3LCB0aGUgZm9sbG93aW5nIHNlcXVlbmNlIHdpbGwgc3VjY2VlZCB0byBtb3VudCwgYnV0IGFu
eQo+IGRlbnRyeSBvdGhlciB0aGFuIHRoZSByb290IGRlbnRyeSB3aWxsIGJlIGEgIndlaXJkIiBk
ZW50cnkgdG8gb3ZsIGFuZAo+IGZhaWwgd2l0aCBFUkVNT1RFLgo+Cj4gICBta2ZzLmV4dDQgLU8g
Y2FzZWZvbGQgbG93ZXIuaW1nCj4gICBtb3VudCAtTyBsb29wIGxvd2VyLmltZyBsb3dlcgo+ICAg
bW91bnQgLXQgb3ZlcmxheSAtbyBsb3dlcmRpcj1sb3dlcix1cHBlcmRpcj11cHBlcix3b3JrZGly
PXdvcmsgb3ZsIC9tbnQKPgo+IE1vdW50aW5nIG9uIGEgc3ViZGlyZWN0b3J5IGZhaWxzLCBhcyBl
eHBlY3RlZCwgYmVjYXVzZSBEQ0FDSEVfT1BfSEFTSAo+IGFuZCBEQ0FDSEVfT1BfQ09NUEFSRSBh
cmUgcHJvcGVybHkgc2V0IGJ5IC0+bG9va3VwLgo+Cj4gRml4IGJ5IGV4cGxpY2l0bHkgcmVqZWN0
aW5nIHN1cGVyYmxvY2tzIHRoYXQgYWxsb3cgY2FzZS1pbnNlbnNpdGl2ZQo+IGRlbnRyaWVzLgo+
Cj4gRml4ZXM6IGJiOWNkOTEwNmIyMiAoImZzY3J5cHQ6IEhhdmUgZmlsZXN5c3RlbXMgaGFuZGxl
IHRoZWlyIGRfb3BzIikKPiBTaWduZWQtb2ZmLWJ5OiBHYWJyaWVsIEtyaXNtYW4gQmVydGF6aSA8
a3Jpc21hbkBzdXNlLmRlPgo+IC0tLQo+ICBmcy9vdmVybGF5ZnMvcGFyYW1zLmMgfCAyICsrCj4g
IGluY2x1ZGUvbGludXgvZnMuaCAgICB8IDkgKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL292ZXJsYXlmcy9wYXJhbXMuYyBi
L2ZzL292ZXJsYXlmcy9wYXJhbXMuYwo+IGluZGV4IDNmZTJkZGUxNTk4Zi4uOTk0OTVmMDc5NjQ0
IDEwMDY0NAo+IC0tLSBhL2ZzL292ZXJsYXlmcy9wYXJhbXMuYwo+ICsrKyBiL2ZzL292ZXJsYXlm
cy9wYXJhbXMuYwo+IEBAIC0yODYsNiArMjg2LDggQEAgc3RhdGljIGludCBvdmxfbW91bnRfZGly
X2NoZWNrKHN0cnVjdCBmc19jb250ZXh0ICpmYywgY29uc3Qgc3RydWN0IHBhdGggKnBhdGgsCj4g
ICAgICAgICBpZiAoIWRfaXNfZGlyKHBhdGgtPmRlbnRyeSkpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBpbnZhbGZjKGZjLCAiJXMgaXMgbm90IGEgZGlyZWN0b3J5IiwgbmFtZSk7Cj4KClBsZWFz
ZSBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4gd2h5IHRoaXMgaXMgbmVlZGVkIHRvIHByZXZlbnQg
cG9zdAptb3VudCBsb29rdXAgZmFpbHVyZXMuCgo+ICsgICAgICAgaWYgKHNiX2hhc19lbmNvZGlu
ZyhwYXRoLT5tbnQtPm1udF9zYikpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBpbnZhbGZjKGZj
LCAiY2FzZWxlc3MgZmlsZXN5c3RlbSBvbiAlcyBub3Qgc3VwcG9ydGVkIiwgbmFtZSk7Cj4KCkkg
aGF2ZSBub3Qgc2VlbiB5b3UgdXNlIHRoZSB0ZXJtICJjYXNlbGVzcyIgb24gdGhlIGxpc3Qgc2lu
Y2UgMjAxOC4gb2xkIGhhYml0cz8KUGxlYXNlIHVzZSB0aGUgdGVybSAiY2FzZS1pbnNlbnNpdGl2
ZSIgYW5kIHBsZWFzZSBtb3ZlIHRoZQpvdmxfZGVudHJ5X3dlaXJkKCkgY2hlY2sKYmVsb3cgdGhp
cyBvbmUsIGJlY2F1c2Ugd2hlbiB0cnlpbmcgdG8gbW91bnQgb3ZlcmxheWZzIG92ZXIgbm9uLXJv
b3QKY2FzZS1pbnNlbnNpdGl2ZQpkaXJlY3RvcnksIHRoZSBtb3JlIHNwZWNpZmljIGVycm9yIG1l
c3NhZ2UgaXMgbW9yZSB1c2VmdWwuCgpUaGFua3MsCkFtaXIuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
