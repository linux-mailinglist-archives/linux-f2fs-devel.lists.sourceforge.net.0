Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F9KJKUNr2mfNAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 19:12:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B232223E5D3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 19:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:References:In-Reply-To:To:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UT8xBFuaKZcY3rWDije9U/PRhPNl7TR0MuOJNW+JKHg=; b=DQ3o8mT1VQ0Frzst8aJvCheLXr
	NM/P2Qgn8vKCwkdCwW2gwzLPRUrD/BHWkBmBDTN0u869ABa+8xqx40o31so28dQN+tMIqPYgwC7y2
	gsGox2ook2cb/dZ381+fUx2iXu0KV4IaibRemJPRQ6Opzuf7yH+3SqxEnqr7KHKVM9OQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzf5v-0008OW-Au;
	Mon, 09 Mar 2026 18:12:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zohar@linux.ibm.com>) id 1vzf5u-0008OL-7y;
 Mon, 09 Mar 2026 18:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Date:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k/HLlQfqfXVQs+Pamcq/LePEaOpgjPTSxe75E2LQHmw=; b=hChV8j+8T4jFc9H8NPDpEczrOp
 5hoS5I9K3LVOon6YlLjafiZ5WQEG7oCeglsO46c2BDvTo5bdBYVCdq+j6FUUjZFDuVoUSh0agC8Xm
 L+1Y2JJbi2m6RLQjnuQwgzAa3f0yOEqaBJSdQAVODeKM5lsCM2DxE1l+xL/lbNx2cdA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Date:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k/HLlQfqfXVQs+Pamcq/LePEaOpgjPTSxe75E2LQHmw=; b=R9l+BrqByg6bS3BXyRFiXGqEm8
 tjOTk6/ZkBU5A8uTl1ZzuQGqukrlw5VAYlY0TtIM10lVpEATu9za1YZJBxAF2ZiRuLHlI1qGcsWHr
 JIXkZZRaJNW9GsqKk/83Zzib8gAwdi1RLW3N9nR23D0LLpad4LHdDqEin9BF8mK1xC0U=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzf5t-00068X-MW; Mon, 09 Mar 2026 18:12:42 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629F7to91275175; Mon, 9 Mar 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=k/HLlQ
 fqfXVQs+Pamcq/LePEaOpgjPTSxe75E2LQHmw=; b=O46FAzGvsE2YmZ6439UqTH
 f//oqGS2NuJoB8xY2lcg12hMD2aNtQ4ID9XxubauhUUNB5XWruUCNbrIED9U/sy2
 gQV+VyjgSVjVmAG4Kam45dqeg/cEF7wexHdqP7q6amhZ86wA+YW4+a7JvMwqNGHX
 K+CR1szr/+ThnSfgYQtyXM8JHrNaKlVVJxj2UpO9B9nfw7GY0lpUaQgYj3FXUBhW
 hCYFfYxjosdklAtClo/CAOyDK0Kz8Ak4d419uQhCeU81c/npAiEGpAq1IaGDP95R
 6czGdohxtpKDTNPNp0U2JdVL6ApX0w6YBruEMYsSerjEZYuw8x9syT1jr4FLueng
 ==
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr7huu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:47:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629FqYI5015725;
 Mon, 9 Mar 2026 17:47:14 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121wp59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:47:14 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 629HlDVJ60162522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2026 17:47:13 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E5775805A;
 Mon,  9 Mar 2026 17:47:13 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4442758054;
 Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown
 [9.61.72.80]) by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Message-ID: <05b5d55c49b5a1bbc43a5315e3c84872e7e634b3.camel@linux.ibm.com>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
Date: Mon, 09 Mar 2026 13:47:08 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1OCBTYWx0ZWRfX4MWriKER56jj
 FHMwPduc6Ya80ytljBjcJCflJZJQpLHypO90MyIljV3F+YGnUEWqD2zkjjI4tBlT1Isyk88nQqD
 Bxsi6y6lZ0wNsui73O82C4s92lOeLYZxoPRW/EZDUOjQSMymQTWQJKaIWTXxL4ETx9VAdofRsxH
 1pntH+n6NhQwxXW3M12fPcKiL5ADcuXldDKiDw4m+7ix+qwvBlo3nspOLghaJ2LE6mxrOiKA5Lh
 GMTERNprgwZauxVcqC/p8dLI9p6C/LOkJmscaf6mdPih3AOPO2LV5vS62FSOrim10LguG5ezUsF
 rdAkmDzMNpwcB3l0gkLlsufFyGUR7bS4yrPNzNHAbiSDJiUdpsUzX7AZ0qjMDEeQhvmbO0coQJz
 4Dc1QnM6RvCUkwZGaB0uRcWv6crLl/+68sTOTDKRYLJY7AFXUTAN+lczmFotg9pSQAz65D+NPWn
 mWAaXfwB8yIBs0IZagQ==
X-Proofpoint-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Proofpoint-ORIG-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69af07a3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=x61hcHDQ_TxU8J0rBBAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090158
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [ I/O socket time out. Trimming the To list.] On Wed,
 2026-03-04 at 10:32 -0500,
 Jeff Layton wrote: > This version squashes all of the format-string
 changes and the i_ino > type change into the same patch. This results in
 a giant 600+ line patch [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzf5t-00068X-MW
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
X-Rspamd-Queue-Id: B232223E5D3
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,linux.ibm.com:replyto,linux.ibm.com:mid];
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

[ I/O socket time out.  Trimming the To list.]

On Wed, 2026-03-04 at 10:32 -0500, Jeff Layton wrote:
> This version squashes all of the format-string changes and the i_ino
> type change into the same patch. This results in a giant 600+ line patch
> at the end of the series, but it does remain bisectable.  Because the
> patchset was reorganized (again) some of the R-b's and A-b's have been
> dropped.
> 
> The entire pile is in the "iino-u64" branch of my tree, if anyone is
> interested in testing this.
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/
> 
> Original cover letter follows:
> 
> ----------------------8<-----------------------
> 
> Christian said [1] to "just do it" when I proposed this, so here we are!
> 
> For historical reasons, the inode->i_ino field is an unsigned long,
> which means that it's 32 bits on 32 bit architectures. This has caused a
> number of filesystems to implement hacks to hash a 64-bit identifier
> into a 32-bit field, and deprives us of a universal identifier field for
> an inode.
> 
> This patchset changes the inode->i_ino field from an unsigned long to a
> u64. This shouldn't make any material difference on 64-bit hosts, but
> 32-bit hosts will see struct inode grow by at least 4 bytes. This could
> have effects on slabcache sizes and field alignment.
> 
> The bulk of the changes are to format strings and tracepoints, since the
> kernel itself doesn't care that much about the i_ino field. The first
> patch changes some vfs function arguments, so check that one out
> carefully.
> 
> With this change, we may be able to shrink some inode structures. For
> instance, struct nfs_inode has a fileid field that holds the 64-bit
> inode number. With this set of changes, that field could be eliminated.
> I'd rather leave that sort of cleanups for later just to keep this
> simple.
> 
> Much of this set was generated by LLM, but I attributed it to myself
> since I consider this to be in the "menial tasks" category of LLM usage.
> 
> [1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070cee42f@brauner/
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Jeff, missing from this patch set is EVM.  In hmac_add_misc() EVM copies the
i_ino and calculates either an HMAC or file meta-data hash, which is then
signed. 

Mimi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
