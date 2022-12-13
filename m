Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357664BFA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 23:56:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5ECE-0003iN-TW;
	Tue, 13 Dec 2022 22:56:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p5ECD-0003iE-FH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 22:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u2qGSTbYaNWfhoMbBYGRZ0uENyDAheZ4Xksg4DOCvVU=; b=Z3WJmNAByl01tYXViC+AALuAYk
 +B7JaUCy+yIJaCkhg3gJuqRlCgQLRnsmb5ZN0pXoedxb1BsNV1UhttDC35lMCp55vPw3mMsWYDtm2
 yM0jCJj6U9cmfsZ5HHkJRThwW/L42qWJNfpTjBXlVWBRrWKNax3J1Hzbc/iam/HM/fmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u2qGSTbYaNWfhoMbBYGRZ0uENyDAheZ4Xksg4DOCvVU=; b=icIUf47BqmW5nSWLCIB4zBEXfi
 oGCluFhnSWsxCO5HDhcU078St6PSgvi4iKuHTfDgWr2it1yGv9trEK5yIveqPuHdVBaxRXZOqhP71
 neTSEPISKki1dTYr2UJm1wIMMMGd7P+GwakqZt8tQIIm97zwMflNrYKSp+qbYv5C5mM0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5ECC-00GIPN-OP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 22:56:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 801F1B8122F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Dec 2022 22:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 470BAC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Dec 2022 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670972173;
 bh=u2qGSTbYaNWfhoMbBYGRZ0uENyDAheZ4Xksg4DOCvVU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tT84Pds5SodpNcykDOAPso0xtjQU0LMXhjoizWz7NvWHRlBMs9z4mGhpNdTx4BELg
 7O+CLZSEX1QmxzAC/ZkGVNTp854Vrpg+ZktGkh4zKYWP95oH1rrV19O3Prm8GCzt9m
 +eN9GfxPlLjXTziVH7y1gfEmR/3dO/dRKAsurGxASSQ3OmoBNDaVjAksKN9+W+loUF
 hXRNfFXZp5zfhfF5yJhkNr4im8WWciWKhuRthlX52QmkzpGjSkIJmoygXWGb0sSGUJ
 8C2mNdnvbu45nIAumA0HCKX9dS2ReGTB8XJTrSJK3z1LBphOVTaerUsnREHCY7Q+M/
 zPkB+UjMNoFEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 25E6FC43141; Tue, 13 Dec 2022 22:56:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Dec 2022 22:56:12 +0000
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
Message-ID: <bug-216050-202145-L3P7sV3lYF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #115 from Guido (guido.iodice@gmail.com) --- (In reply to Thomas from comment
 #114) > (In reply to Guido from comment #113) > > Why not test the
 "f2fs_io_schedule_timeout" kernel patch in [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5ECC-00GIPN-OP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=216050

--- Comment #115 from Guido (guido.iodice@gmail.com) ---
(In reply to Thomas from comment #114)
> (In reply to Guido from comment #113)
> 
> Why not test the "f2fs_io_schedule_timeout" kernel patch in combination with
> running the manual GC script one time (doesn't seem to matter if you run
> this on unpatched or patched kernel, all that's important is that you boot
> without any garbage into the patched kernel, so reboot right after executing
> the script) ?
> 
> I did this cause I readed between the lines that this combination worked for
> others, too, and am having no more issues since around 5 days. And yes, I'm
> doing a lot to try to trigger this bug again.
> 
> Also is it save to assume that this issue only occurs on root partitions
> which are on NVMe drives? I see a pattern here but still not 100% sure.

I already tried the patch (but not in combination with the script) and it
solved the problem of 100% cpu but still f2fs_gc remains stuck and doesnt end
the garbage collection, so the user cant shutdown in a safe manner.

Anyway if I will have the 100% cpu problem in the following days, I'll try it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
