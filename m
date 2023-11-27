Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA237FA584
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 17:02:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7e3f-0001vR-J0;
	Mon, 27 Nov 2023 16:02:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiederm@xmission.com>) id 1r7e3a-0001uy-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnIsW2gRlEkCMgJZdG09I4YKTZY6znkqa+JAZFPAg/o=; b=A+sYll0MV9YSVA5xCARRv0US49
 l2JFlD3olQAUGbnU5PGOpKv7yKp8n2IlmKPqYFSUKAEOm5inTFiCmgNtuZXOVCLKP34DzUZa2r0zW
 hvF38Y0hQwDwOnxXp0aFouk1os8CBKHu87YJBl870IZOZkthThDX+GeSrQXylKauTiSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MnIsW2gRlEkCMgJZdG09I4YKTZY6znkqa+JAZFPAg/o=; b=YkSKxS5cpVrofTuf0zCCUVws2B
 Lfzay1hxnHdnkgJvgwykqh030tlhx0C3k76RPtxyHgublII+70gKK8hiMgORbU4apBJgPDSdFgX/K
 +QqlmIIxQHkNKkRSecH8QHmeij9bV0JuD580jbYg1EDqDFJb1wp6GXHR1sE23QffmJz4=;
Received: from out02.mta.xmission.com ([166.70.13.232])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7e3W-00H7MM-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:01:58 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:53182)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7e3M-00Ahie-5g; Mon, 27 Nov 2023 09:01:44 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:51768
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1r7e3K-006NOb-0n; Mon, 27 Nov 2023 09:01:43 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <20231125220136.GB38156@ZenIV>
 <20231126045219.GD38156@ZenIV> <20231126184141.GF38156@ZenIV>
 <20231127063842.GG38156@ZenIV>
 <87jzq3nqos.fsf@email.froward.int.ebiederm.org>
Date: Mon, 27 Nov 2023 10:01:34 -0600
In-Reply-To: <87jzq3nqos.fsf@email.froward.int.ebiederm.org> (Eric
 W. Biederman's message of "Mon, 27 Nov 2023 09:47:47 -0600")
Message-ID: <878r6jnq1t.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1r7e3K-006NOb-0n; ; ;
 mid=<878r6jnq1t.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.168.167; ; ;
 frm=ebiederm@xmission.com; ; ; spf=pass
X-XM-AID: U2FsdGVkX18LzyKBjPL9+mOeggwlTuuNaPzk+DvVEcQ=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
 T_TooManySym_01,T_TooManySym_02,T_TooManySym_03,T_TooManySym_04,
 T_TooManySym_05,T_XMDrugObfuBody_08,XMSubLong autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  1.0 T_XMDrugObfuBody_08 obfuscated drug references
 *  0.0 T_TooManySym_05 8+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_04 7+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1572 ms - load_scoreonly_sql: 0.05 (0.0%),
 signal_user_changed: 12 (0.8%), b_tie_ro: 10 (0.6%), parse: 1.54
 (0.1%), extract_message_metadata: 48 (3.1%), get_uri_detail_list: 1.85
 (0.1%), tests_pri_-2000: 66 (4.2%), tests_pri_-1000: 3.9 (0.2%),
 tests_pri_-950: 1.64 (0.1%), tests_pri_-900: 30 (1.9%), tests_pri_-90:
 340 (21.6%), check_bayes: 337 (21.5%), b_tokenize: 15 (1.0%),
 b_tok_get_all: 65 (4.1%), b_comp_prob: 2.9 (0.2%), b_tok_touch_all:
 201 (12.8%), b_finish: 1.20 (0.1%), tests_pri_0: 1017 (64.7%),
 check_dkim_signature: 0.73 (0.0%), check_dkim_adsp: 18 (1.2%),
 poll_dns_idle: 15 (0.9%), tests_pri_10: 4.2 (0.3%), tests_pri_500: 43
 (2.7%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  "Eric W. Biederman" <ebiederm@xmission.com> writes: > I am
 confused what is going on with ext4 and f2fs. I think they > are calling
 d_invalidate when all they need to call is d_drop. ext4 and f2f2 are buggy
 in how they call d_invalidate, if I am reading the code correctly. 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [166.70.13.232 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [166.70.13.232 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7e3W-00H7MM-P3
Subject: Re: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
 [PATCH v6 0/9] Support negative dentries on case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

"Eric W. Biederman" <ebiederm@xmission.com> writes:

> I am confused what is going on with ext4 and f2fs.  I think they
> are calling d_invalidate when all they need to call is d_drop.

ext4 and f2f2 are buggy in how they call d_invalidate, if I am reading
the code correctly.

d_invalidate calls detach_mounts.

detach_mounts relies on setting D_CANT_MOUNT on the top level dentry to
prevent races with new mounts.

ext4 and f2fs (in their case insensitive code) are calling d_invalidate
before dont_mount has been called to set D_CANT_MOUNT.

Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
