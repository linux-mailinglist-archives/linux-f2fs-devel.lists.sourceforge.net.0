Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C932644935
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 17:29:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2aov-0007lc-Kz;
	Tue, 06 Dec 2022 16:29:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2aov-0007lT-7C
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 16:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzNTQmSyTPv+vd4vruaeRHTL+sn4VzAM487ohUeAnsM=; b=aMyuLfJFM7sFA+KAH14c4rgWkQ
 Li+5HIp2AvkXdrrEBPvuRA1cUGZDR0ZJ+bo5oTMPTnW3vwxatpY6ksQgaIM4q489/waK+fSfMD0xi
 nWJ62H9DIhlaJykoBPzTz9d51ygYH/AUTLhHMVNAnxgs1xjfjsKs4AXqltKpOz3YH6Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zzNTQmSyTPv+vd4vruaeRHTL+sn4VzAM487ohUeAnsM=; b=Vhvu+TWv4SrsxugEFCEixp57cR
 03VcxPFja+6a0R9uaqD7tFTBKikEdWoYIE7Z32nqgRzD4BGzZY8+261I2EnHLK65oBtBAY8wZ2+Lt
 UcAiTmzRpRAVaOPxW8YME3OqtGQjgJXDTHucNqqBINHdV25fHKNwTNC7bYaKbFlgGogU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2aoj-0003ho-5N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 16:29:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC084B81A10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 16:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 931F0C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670344145;
 bh=zzNTQmSyTPv+vd4vruaeRHTL+sn4VzAM487ohUeAnsM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K3Fn01EA+D0y+DLwLcNYB1E5gtd2dne34rEj7f8/KDXWK1jSjdD5mHNP77XThurou
 fM+OB6R4AeB1lK1F+zXuNYmt1jOIt9LqahxTeSRyMjNgjhG1PCkoiaE5HpNzKF3YB3
 v8iczqb/Z8EKzn90wWYi0ihJMuTBsJBfUrfFQ359CJ+VQ4TWr7Oguv0T8CQBgmtPrU
 2FFRxEGuZIpsbcwoVvt4M4st9GCBMNsLiiWViIbUgSYeqAkUVa6y9zW3C+W3Ac36kW
 SpLtNBZYJkMBNoZwmxb7sRnRFEzRsPiihaMOOxu7YJSjjyfeTDTxUJTHYIGMBk76Gj
 WoYHHXPym69gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 75A24C433E4; Tue,  6 Dec 2022 16:29:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Dec 2022 16:29:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-AS8SoGR5d3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #101 from Guido (guido.iodice@gmail.com) --- Very interesting: I run the
 script with kernel 5.15.81 and it works well on my root partition 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: f2fs-gc.sh]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2aoj-0003ho-5N
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTYwNTAKCi0tLSBD
b21tZW50ICMxMDEgZnJvbSBHdWlkbyAoZ3VpZG8uaW9kaWNlQGdtYWlsLmNvbSkgLS0tClZlcnkg
aW50ZXJlc3Rpbmc6IEkgcnVuIHRoZSBzY3JpcHQgd2l0aCBrZXJuZWwgNS4xNS44MSBhbmQgaXQg
d29ya3Mgd2VsbCBvbiBteQpyb290IHBhcnRpdGlvbgoKCnN1ZG8gYmFzaCAuL2YyZnMtZ2Muc2gK
W3N1ZG9dIHBhc3N3b3JkIGRpIGd1aWRvOiAKUGVyZm9ybWluZyBHQyBvbiAvc3lzL2ZzL2YyZnMv
bnZtZTBuMXAzLwoxODQ5CjQyNQozMzAKMzA3CjEKR0MgY29tcGxldGVkIGZvciAvc3lzL2ZzL2Yy
ZnMvbnZtZTBuMXAzLwpQZXJmb3JtaW5nIEdDIG9uIC9zeXMvZnMvZjJmcy9udm1lMG4xcDQvCjQ3
MgoxMTgKNDcKR0MgY29tcGxldGVkIGZvciAvc3lzL2ZzL2YyZnMvbnZtZTBuMXA0LwpQZXJmb3Jt
aW5nIEdDIG9uIC9zeXMvZnMvZjJmcy9udm1lMW4xLwpHQyBjb21wbGV0ZWQgZm9yIC9zeXMvZnMv
ZjJmcy9udm1lMW4xLwpndWlkb+6CsH7ugrB0bXDugrAk7oKwCgotLSAKWW91IG1heSByZXBseSB0
byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1h
aWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
