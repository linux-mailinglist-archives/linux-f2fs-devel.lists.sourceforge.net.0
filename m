Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPiUL/8Yr2nHNgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:01:19 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A116623F12D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:References:In-Reply-To:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NdHrOad29vYvq22G73V6wgtr607Vr63DQdx6FQffoU=; b=XyXJTQMfb6NwtvZT/vAMXECge+
	A/djJb0HOHF6Nvan/spGE2aFXhxMKWYJl/214PSY+QtOlOJd7DUSR8jB76ocYwIot57ICbxrK2ACE
	k6P6RaHPelUlDtB9ybjlm0YhObZpCEIPUUI4b/xc3XTQMxzK+9bLrqeocj1T6ylTzR4M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzfqp-00011Z-3A;
	Mon, 09 Mar 2026 19:01:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zohar@linux.ibm.com>) id 1vzfqn-00011P-FO;
 Mon, 09 Mar 2026 19:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Date:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5swsN0rUxxavDq9zMYnPJS2Jv47BUk07HnZRz0pbh40=; b=l/kjJfg+3j9hHxbGP1UzzC+vAy
 QTR3JnSTTz26C0MgvhU3V03l2MkpMJlwrsGW2JDWP/tMpfXuGHzJHUjiLlK3842vBWPjw5nnTqx/1
 98uWxESBwHez8cvNIUVCtlsNadsg8tl8YtZzhsrtc4v30R3ILbwGtcPs/ZFTUMYHq9hU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Date:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5swsN0rUxxavDq9zMYnPJS2Jv47BUk07HnZRz0pbh40=; b=VPt99ILhFRHJEElB2NzCEG1k2j
 FeY7ju/Vw6vxsYmzaNGPlxWY7tRsBUGOF/wbrWgHf6GSsnK3x/iFeBJDiokpLjHjkQXdUl4hoNf06
 N2KTsJm+qPe0HKcOYseLWqBgVZXyYbOUR8glr7AoVMOEOzQmjZiMUL56GgU9eUBW+s9c=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzfqm-0008Te-R4; Mon, 09 Mar 2026 19:01:09 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629BiYp9402979; Mon, 9 Mar 2026 19:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=5swsN0
 rUxxavDq9zMYnPJS2Jv47BUk07HnZRz0pbh40=; b=d2IgH4d2cI76xjXosS08+5
 z7p4cmRM3+vsUQToHiG2nB8DP/joMF596z7727f61cqMRXeNJJpaPHxOajT8sUoA
 4hdB+fd4u1HsuNVMFr3OsadtAG1CKvM35tVtsMpgaqqCM2ZBMMXJkpG++BlAdorh
 a25OzV7jJWb6oFmtakhiLNn+qzaAmqYeRhvuloIidiB6X0BgKDL71O4yfuzN3RUh
 AoqpvZ653XjMWMMwrSPrZbVK8uRNsl6RplSUCc6nWvYsnXyDf2A2VF2Up7qZowSZ
 aJlNA2A77/MP8caSRZkmC6D9PsUx9bOXT5BvUfyuxzfxj3qWmymQF0ir3jH77L1w
 ==
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcun7rdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 19:00:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629FvaW1015771;
 Mon, 9 Mar 2026 19:00:08 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121ww0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 19:00:08 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 629J079s4915810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2026 19:00:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B444C58064;
 Mon,  9 Mar 2026 19:00:07 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E09F35805A;
 Mon,  9 Mar 2026 19:00:04 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown
 [9.61.72.80]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2026 19:00:04 +0000 (GMT)
Message-ID: <c9500adc562665d44feaca9206f23a5ba07432c1.camel@linux.ibm.com>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <f22758116dabd3c135a833bcb5cfcd2ea4f6ecf4.camel@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
 <05b5d55c49b5a1bbc43a5315e3c84872e7e634b3.camel@linux.ibm.com>
 <f22758116dabd3c135a833bcb5cfcd2ea4f6ecf4.camel@kernel.org>
Date: Mon, 09 Mar 2026 15:00:04 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IXXixi4WEaMt5ZLipHNyYmLY2v6HWLsd
X-Authority-Analysis: v=2.4 cv=Hp172kTS c=1 sm=1 tr=0 ts=69af18ba cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=o9bg_TheAfZNAX0b3qsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2NSBTYWx0ZWRfX6z/xa1oiKPHE
 y5EqU++9e+D9gbPsThEA40KAIQaMNONuQFv6rphXC4UXK9hbuizpabscJIBcCstT+gR2HtuKysP
 juuUkxGaMl7wxMTZHQleqdpaj1BApzfJEmhJlxbY5TY+zaAhKCE7FmRzIMEIOEQTi0cM+UreNNn
 frwDdmfnFwh4sJREHHlQDdGWVECyjZbYar7Sfrv1WmeMPxeeCh8/LcWzrRHQxRnw2tvA2a4D8NR
 c7ma8KolSpfVjNgJ0OleioMQBwEZGtoJr7jBKqVpvCDiflI9IHYr2EnI/OMDVmsDQcjOAtzHE2E
 Cqs2ZZL0dk00OuX7g/sw5bXFEAXaWjWvfls2vJrY4HNOaz6u97184uDaehJuW5B2dmjBv87lTJU
 mdY20MyhE/Ql/CExB+A/Xcl6KkN3u1kmsdTu44KKD0LP1RVDdsR5dGWPIvWKEchoHvJnuy6WqMG
 FGu2ZyF+vBxNE+HNtfg==
X-Proofpoint-ORIG-GUID: IXXixi4WEaMt5ZLipHNyYmLY2v6HWLsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090165
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2026-03-09 at 13:59 -0400, Jeff Layton wrote: > On
 Mon, 2026-03-09 at 13:47 -0400, Mimi Zohar wrote: > > [ I/O socket time out.
 Trimming the To list.] > > > > On Wed, 2026-03-04 at 10:32 -0500 [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzfqm-0008Te-R4
Subject: Re: [f2fs-dev] [PATCH v3 00/12] vfs: change inode->i_ino from
 unsigned long to u64
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
From: Mimi Zohar via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mimi Zohar <zohar@linux.ibm.com>
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-x25@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 codalist@coda.cs.cmu.edu, linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
 devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, selinux@vger.kernel.org, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-media@vger.kernel.org,
 linux-can@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, linux-fscrypt@vger.kernel.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A116623F12D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ibm.com:s=pp1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ibm.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:replyto,linux.ibm.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[zohar@linux.ibm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

On Mon, 2026-03-09 at 13:59 -0400, Jeff Layton wrote:
> On Mon, 2026-03-09 at 13:47 -0400, Mimi Zohar wrote:
> > [ I/O socket time out.  Trimming the To list.]
> > 
> > On Wed, 2026-03-04 at 10:32 -0500, Jeff Layton wrote:
> > > This version squashes all of the format-string changes and the i_ino
> > > type change into the same patch. This results in a giant 600+ line patch
> > > at the end of the series, but it does remain bisectable.  Because the
> > > patchset was reorganized (again) some of the R-b's and A-b's have been
> > > dropped.
> > > 
> > > The entire pile is in the "iino-u64" branch of my tree, if anyone is
> > > interested in testing this.
> > > 
> > >     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/
> > > 
> > > Original cover letter follows:
> > > 
> > > ----------------------8<-----------------------
> > > 
> > > Christian said [1] to "just do it" when I proposed this, so here we are!
> > > 
> > > For historical reasons, the inode->i_ino field is an unsigned long,
> > > which means that it's 32 bits on 32 bit architectures. This has caused a
> > > number of filesystems to implement hacks to hash a 64-bit identifier
> > > into a 32-bit field, and deprives us of a universal identifier field for
> > > an inode.
> > > 
> > > This patchset changes the inode->i_ino field from an unsigned long to a
> > > u64. This shouldn't make any material difference on 64-bit hosts, but
> > > 32-bit hosts will see struct inode grow by at least 4 bytes. This could
> > > have effects on slabcache sizes and field alignment.
> > > 
> > > The bulk of the changes are to format strings and tracepoints, since the
> > > kernel itself doesn't care that much about the i_ino field. The first
> > > patch changes some vfs function arguments, so check that one out
> > > carefully.
> > > 
> > > With this change, we may be able to shrink some inode structures. For
> > > instance, struct nfs_inode has a fileid field that holds the 64-bit
> > > inode number. With this set of changes, that field could be eliminated.
> > > I'd rather leave that sort of cleanups for later just to keep this
> > > simple.
> > > 
> > > Much of this set was generated by LLM, but I attributed it to myself
> > > since I consider this to be in the "menial tasks" category of LLM usage.
> > > 
> > > [1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070cee42f@brauner/
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > 
> > Jeff, missing from this patch set is EVM.  In hmac_add_misc() EVM copies the
> > i_ino and calculates either an HMAC or file meta-data hash, which is then
> > signed. 
> > 
> > 
> 
> Thanks Mimi, good catch.
> 
> It looks like we should just be able to change the ino field to a u64
> alongside everything else. Something like this:
> 
> diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
> index c0ca4eedb0fe..77b6c2fa345e 100644
> --- a/security/integrity/evm/evm_crypto.c
> +++ b/security/integrity/evm/evm_crypto.c
> @@ -144,7 +144,7 @@ static void hmac_add_misc(struct shash_desc *desc, struct inode *inode,
>                           char type, char *digest)
>  {
>         struct h_misc {
> -               unsigned long ino;
> +               u64 ino;
>                 __u32 generation;
>                 uid_t uid;
>                 gid_t gid;
> 

Agreed.

> 
> That should make no material difference on 64-bit hosts. What's the
> effect on 32-bit? Will they just need to remeasure everything or would
> the consequences be more dire? Do we have any clue whether anyone is
> using EVM in 32-bit environments?

All good questions. Unfortunately I don't know the answer to most of them. What
we do know: changing the size of the i_ino field would affect EVM file metadata
verification and would require relabeling the filesystem.  Even packages
containing EVM portable signatures, which don't include or verify the i_ino
number, would be affected.

Mimi






_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
