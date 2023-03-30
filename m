Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E356CFCE7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phmpV-0001lW-DN;
	Thu, 30 Mar 2023 07:36:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1phmpU-0001lQ-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 07:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDKC2o5BedZZinhqEqlApZSFm6lp2ICzaIsrbMRcPa4=; b=Di9SX6lx+HbP5fYcUlm654ofkn
 DXhHz/gPdatwbH5rchRpv2N9GYngyvkkNEmFIvMgLoHOiQyW2b4Nmg25ekuydo7XQtb8jH9gOet9e
 aOleED3pvhEF3Qysdl4v9EE4CwsfN7rpdoosK1LYWVIxyQ6RhzXk/fD9JI+b7xrDtXhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hDKC2o5BedZZinhqEqlApZSFm6lp2ICzaIsrbMRcPa4=; b=fFeeA6nMxPCkhiaEqrfu3xEZXJ
 OyYRgvesQbo5lM610cmFRa+0vrgtp0XDzxgEFRhEC6DCKqdmrAHinET9mFORHTLQEQ75jjqZnCQoV
 b4mRvV0iDqSo/07n/KpUuaN+z9JEPEwsGAfv5UgJ+cxfwdEnP9NNpS8JueloFLrlkvC8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phmpO-009GY7-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 07:36:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 801EEB82608
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 07:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 379A8C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680161760;
 bh=hDKC2o5BedZZinhqEqlApZSFm6lp2ICzaIsrbMRcPa4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oEhgQKJ10JacLMufM3mXy5jxT5sDjXJ2IUO6/odIi219ExDxc4XL+fyZoECwPAfgS
 9KaTpizGxKdpHVEk79Wbbvy2EgImQSYH5BYJFo8/Ok6m3bdETeWAtx9YdfmN6Jt4R5
 S2v8DDZ2sfaHV+1o8RandUPei+lnr+PkDxZDasyOuosm9X3xpnVhdCYKNHmPC2gDh0
 3kRmH8MrayHcsjW1zQaMRfdTCvrSzvx63fGMIfa2GOr0QvOvU1GuEo/do2JORuR1kh
 siya6PgSBhhsQAy0GbmmlS1Ldly5ZTk/zbQE+Huyks8j1Ysr9Nj7jdEJdamqECquFo
 Kd1nxCEXpn4vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 15DEFC43142; Thu, 30 Mar 2023 07:36:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Mar 2023 07:35:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michalechner92@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217266-202145-7MFpPGDJIf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217266-202145@https.bugzilla.kernel.org/>
References: <bug-217266-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=217266 --- Comment
    #4 from michalechner92@googlemail.com --- Am Do., 30. März 2023 um 05:31
    Uhr schrieb Chao Yu <chao@kernel.org>: > > On 2023/3/30 10:48, bugzilla-daemon@kernel.org
    wrote: > > https://bugzi [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phmpO-009GY7-Vo
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
b21tZW50ICM0IGZyb20gbWljaGFsZWNobmVyOTJAZ29vZ2xlbWFpbC5jb20gLS0tCkFtIERvLiwg
MzAuIE3DpHJ6IDIwMjMgdW0gMDU6MzEgVWhyIHNjaHJpZWIgQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPjoKPgo+IE9uIDIwMjMvMy8zMCAxMDo0OCwgYnVnemlsbGEtZGFlbW9uQGtlcm5lbC5vcmcg
d3JvdGU6Cj4gPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIx
NzI2Ngo+ID4KPiA+IC0tLSBDb21tZW50ICMyIGZyb20gc2hpbGthIChzaGlsa2F6eEBnbWFpbC5j
b20pIC0tLQo+ID4gKEluIHJlcGx5IHRvIG1pY2hhbGVjaG5lcjkyIGZyb20gY29tbWVudCAjMSkK
PiA+PiBUaGF0IGxvb2tzIGlkZW50aWNhbCB0byB3aGF0IEkgcmVwb3J0ZWQgbGFzdCB3ZWVrIGhl
cmU6Cj4gPj4KPiA+PiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2xpbnV4LWYyZnMvbWFpbG1h
bi9tZXNzYWdlLzM3Nzk0MjU3Lwo+Cj4gQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgdHJ5IHcvIGJl
bG93IHBhdGNoPwo+Cj4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hNDZiZWJkNTAyZmUxYTNiZDFk
MjJmNjRjZWRkOTNlN2U3NzAyNjkzCj4KCkhlbGxvIENoYW8sCgpUaGFua3MgZm9yIHRoZSBhbnN3
ZXIuCgpUaGUgY3Jhc2hlcyB3ZXJlIHJlcG9ydGVkIHRvIG1lIGFmdGVyIEkgbWVyZ2VkIHRoZSBs
YXRlc3QgZjJmcy1zdGFibGUKcGF0Y2hlcyBmb3IgNS4xMCBmcm9tCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy1zdGFibGUuZ2l0L2xv
Zy8/aD1saW51eC01LjEwLnkKCldoaWNoIGluY2x1ZGVzIHRoZSBjb21taXQgeW91IGp1c3QgbWVu
dGlvbmVkCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2ph
ZWdldWsvZjJmcy1zdGFibGUuZ2l0L2NvbW1pdC8/aD1saW51eC01LjEwLnkmaWQ9NzIwNzA5YzMy
NzYyMjBmZGI3MGU5Mzg1ZDg3YzYxNjk0NzZmMDRlNwoKCk15IHNvdXJjZSBpcyBoZXJlOgpodHRw
czovL2dpdGh1Yi5jb20vZnJlYWswNy9LaXJpc2FrdXJhX1BhbnRhaC9jb21taXRzL3BhbnRhaC10
cTJhLjIzMDMwNS9mcy9mMmZzCgpUaGUgY3Jhc2hlcyB3ZXJlIHJlcG9ydGVkIHRvIG1lIGFmdGVy
IEkgbWVyZ2VkIHRoZSBsYXRlc3QgdGFnIG9mCmYyZnMtc3RhYmxlLCBpZiB5b3UgbG9vayBiYWNr
IHRocm91Z2ggbXkgaGlzdG9yeSBvbiBNYXJjaCA0dGggYW5kCk1hcmNoIDExdGguCgpJIHJldmVy
dGVkIHRoZSBsYXRlc3QgZjJmcy1zdGFibGUgcGF0Y2hlcyBvbiBtYXJjaCAyM3JkIGFuZCBkaWRu
wrR0CnJlY2VpdmUgYSBmdXJ0aGVyIHJlcG9ydCBvZiB0aGUgY3Jhc2ggc28gZmFyLgoKCj4gPj4K
PiA+Pgo+ID4KPiA+IFllcCwgaXQgc2VlbXMgdmVyeSBzaW1pbGFyLCBidXQgSSBkbyBub3QgZW5j
b3VudGVyIHRoaXMgcHJvYmxlbSB1bnRpbAo+IHVwZGF0ZSB0bwo+ID4ga2VybmVsIDYuMi44Lgo+
ID4gQmVmb3JlIEkgc2F3IHlvdXIgcmVwbHksIEkgZ3Vlc3MgdGhlcmUgbWlnaHQgZXhpc3Qgc29t
ZSBzdWJ0bGUgY29uZmxpY3RzCj4gPiBiZXR3ZWVuIG5ldyBmZWF0dXJlIGluIDYuMi44IGtlcm5l
bCBhbmQgdGhlIGYyZnMgbW9kdWxlLiBXaXRoIHlvdXIgaW5mbywgaXQKPiBpcwo+ID4gaGlnaGx5
IHBvc3NpYmxlIHRoYXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIGYyZnMgZXhpc3RzIHNvbWUgYnVn
LCBhbmQgbmV3Cj4ga2VybmVsCj4gPiBmZWF0dXJlIG1pZ2h0IGZyZXF1ZW50bHkgdHJpZ2dlciBp
dC4KPiA+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1h
aWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
