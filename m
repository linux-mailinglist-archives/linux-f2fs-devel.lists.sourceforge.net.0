Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866B6D4F2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 19:38:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjO84-00063L-LC;
	Mon, 03 Apr 2023 17:38:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pjO7r-000632-KQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 17:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5gyKjfd0DkxPYJ+bKGgr+bS+q7CBggHcMAI08deeF68=; b=aAtodFKE6W1d3iGIRqfQ4bS0w1
 Ta4T2bxw1Hxvri89XxNb0/XEqrJHd5t8DnwPYhHji04W42igDNp+fVhB7qtbqcSHeza/1Lt4N7kpn
 vd/5lmcfykIlfmnKCw4TG1qEdTWNHQZp/eqNbeyR26voLjLbgXh4aaUwVIKdn097at+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5gyKjfd0DkxPYJ+bKGgr+bS+q7CBggHcMAI08deeF68=; b=EzMdaHP9faYk3PNu4Hcd8+bw/0
 1CP2eVGh3+unIhMwYxAoAM+JDcvIyOXI08SdQFXg8/nSTmHF4GlxrJy1LUZ+89XLeIoWRXrA6nL4/
 IFoGj2JFlOYRvQzsiofwalpqAgnpwkhGRmv/qWaa9YFsyyraY9aSQzTDkv8m8qrSPEGc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjO7r-0005bS-5x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 17:37:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C53146206E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 17:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F664C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 17:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680543465;
 bh=bwycBeX2n3kTg9FNnG8O1RyJyuEwQoILUvvbuKkaQpc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aNTmUSn2ZInVMZz9FmqpyvEHHP8Qkl9GVShUysivp2wgrPnqRcqiwWf0Nu3u2g/xO
 +v1h0wxcaQiDSLIrgPDOdC5r+l1pg3penjdz96SwZxxCJR8O/HekLzYOYGBOqQ8SQV
 3Y2HqPfu87RvkCn8Fpr24YBIRl+aa+WIi6+sSa3L5zOYFuoFpGoO/A55CK43rcB0+A
 A/88sfhFd314LPppW7TzKYvq8OBrupXW+OHW8KcP9d1MThJdwWFJAHJZNG4mdCN9Oa
 71iLvsytiGoacvMnA3w3MpTmSh2z0nIoUanUgsZt37K03qhyP2VmPmXOOd+3XKGojb
 gezjnKbKF6/1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1B4EFC43141; Mon,  3 Apr 2023 17:37:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 03 Apr 2023 17:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michalechner92@googlemail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217266-202145-4YO1NWk5bg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217266-202145@https.bugzilla.kernel.org/>
References: <bug-217266-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=217266 ---
 Comment
 #7 from michalechner92@googlemail.com --- Am Mo., 3. Apr. 2023 um 16:08 Uhr
 schrieb <bugzilla-daemon@kernel.org>: > >
 https://bugzilla.kernel.org/show_bug.cgi?id=217266
 > > Chao Yu (chao@k [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjO7r-0005bS-5x
Subject: [f2fs-dev] [Bug 217266] kernel panic on f2fs filesystem when
 f2fs_commit_atomic_write
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTcyNjYKCi0tLSBD
b21tZW50ICM3IGZyb20gbWljaGFsZWNobmVyOTJAZ29vZ2xlbWFpbC5jb20gLS0tCkFtIE1vLiwg
My4gQXByLiAyMDIzIHVtIDE2OjA4IFVociBzY2hyaWViIDxidWd6aWxsYS1kYWVtb25Aa2VybmVs
Lm9yZz46Cj4KPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIx
NzI2Ngo+Cj4gQ2hhbyBZdSAoY2hhb0BrZXJuZWwub3JnKSBjaGFuZ2VkOgo+Cj4gICAgICAgICAg
ICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgICAgICAgICAgICBTdGF0dXN8TkVXICAgICAgICAgICAgICAgICAgICAg
ICAgIHxBU1NJR05FRAo+ICAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHxjaGFvQGtlcm5lbC5vcmcKPgo+IC0tLSBDb21tZW50ICM1IGZyb20gQ2hhbyBZdSAo
Y2hhb0BrZXJuZWwub3JnKSAtLS0KPiBIaSBzaGlsa2EsIE1pY2hhIEwsCj4KPiBEbyB5b3UgaGF2
ZSBhIHJlcHJvZHVjZXI/Cj4KPiAtLQo+IFlvdSBtYXkgcmVwbHkgdG8gdGhpcyBlbWFpbCB0byBh
ZGQgYSBjb21tZW50Lgo+Cj4gWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cj4g
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKCkhleSBDaGFvLAoKSSBkb27CtHQgaGF2ZSBhIHJlcHJvZHVjZXIuIEl0IGp1c3Qgc2VlbXMg
dG8gaGFwcGVuIHJhbmRvbWx5IHdoaWxlCnVzaW5nIHRoZSBkZXZpY2UgdmVyeSByYXJlbHkuCgoK
QW0gTW8uLCAzLiBBcHIuIDIwMjMgdW0gMTk6MDAgVWhyIHNjaHJpZWIgPGJ1Z3ppbGxhLWRhZW1v
bkBrZXJuZWwub3JnPjoKPgo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjE3MjY2Cj4KPiBKYWVnZXVrIEtpbSAoamFlZ2V1a0BrZXJuZWwub3JnKSBjaGFuZ2Vk
Ogo+Cj4gICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFk
ZGVkCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHxqYWVnZXVrQGtlcm5lbC5vcmcKPgo+IC0tLSBDb21tZW50ICM2
IGZyb20gSmFlZ2V1ayBLaW0gKGphZWdldWtAa2VybmVsLm9yZykgLS0tCj4gSSB0aGluayB0aGlz
IGZpeGVzIHRoZSBwYW5pYy4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRl
dmVsL1pDc0V5dERqcUVqUURQaU9AZ29vZ2xlLmNvbS9ULyN1Cj4KPiAtLQo+IFlvdSBtYXkgcmVw
bHkgdG8gdGhpcyBlbWFpbCB0byBhZGQgYSBjb21tZW50Lgo+Cj4gWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6Cj4gWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhl
IGJ1Zy4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCkhleSBKYWVnZXVrLAoKVGhhbmtzIGZvciB0aGUgbGlu
ayBhbmQgdGFraW5nIGEgbG9vayEgSSB3aWxsIGNoZXJyeS1waWNrIHRoZSBmaXggdG8KbXkgdHJl
ZSBhbmQgc2hpcCBpdCBvbiB0aGUgbmV4dCByZWxlYXNlIG9uIFhEQS4KCknCtGxsIHJlcG9ydCBi
YWNrIGluIGNhc2UgSSBnZXQgbW9yZSBsb2dzIHdpdGggdGhlIHBhbmljIEkgc2hhcmVkIGVhcmxp
ZXIuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUg
YXNzaWduZWUgb2YgdGhlIGJ1Zy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
