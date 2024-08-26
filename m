Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8695F86F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 19:44:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sidlN-0005e0-CG;
	Mon, 26 Aug 2024 17:44:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bvanassche@acm.org>) id 1sidlM-0005dt-Ja
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ky1WtZTB1vAFitwSZSr9oE2Lkfv8g9tc5SCDtUd5Igw=; b=H7S6AEe84LxS168kRmPCDvPoU/
 DnRQUbPAJ167K/MJWAGEYEfILwivms3NFNnmMJr/CRVw3aIAdDEtHIeS0cdvYXGyDYU3KYSP27Uu/
 f236ecFk8TSZD7txYhcMwGOZUAUMj107l0oUaw78WfUGs11HMP/nVQSKQWDfV4vgLTcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ky1WtZTB1vAFitwSZSr9oE2Lkfv8g9tc5SCDtUd5Igw=; b=loXhSHa2dr+wLQCtoOJHbKxXEC
 +ZsZuYpXdLJIvz9JC+YpaN3jf+YS5/ySIHWUEACGgj46hTIgcfwIzhTjvRoMHKB1Ng2fqHjt4j+66
 asVEi5vD3pvSQATorIn/ByinbCsL+wjNffhf8LZ36FO5mr06yJnGkJlsigwYg5kHa1Ik=;
Received: from 008.lax.mailroute.net ([199.89.1.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sidlL-0007Cb-Up for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:44:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4Wsyj54Rwmz6ClY9F;
 Mon, 26 Aug 2024 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:references:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1724694244; x=1727286245; bh=Ky1WtZTB1vAFitwSZSr9oE2L
 kfv8g9tc5SCDtUd5Igw=; b=h8BmHZmwBPtHY/5huyweT7LC/hAMCyRbF8I/nDUc
 eInWFOIaDBLKsf8lBA747JuClgmy4aunEUTem/G+Zb1CBh1IASDyPUTvkMLdO9+X
 qf9Im9LfJJDOPEtLBbARVpojuH0XyhSxuH+s1pxtSSbzb0ndrXh6q9dJydWXuOEf
 9bkLSmmHa0O14/T+VRXR3GRbmD3jhZEV7dDoa8tyenLHf80v0Pa1BDJnwxoLR7YF
 vRgyjI5dlCOoXvve3MUZyzxLD0S6dzNucYTg+phQSn2J5HNK6zgcaHT7GQr3m8oI
 ZBY8H2kdtb4aZJ1oadDKSG/M5XNQpbawLnms14gmqV/TJw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TfuIq-julCUO; Mon, 26 Aug 2024 17:44:04 +0000 (UTC)
Received: from [172.31.110.201] (unknown [216.9.110.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Wsyhx6Vmgz6ClY98;
 Mon, 26 Aug 2024 17:44:01 +0000 (UTC)
Message-ID: <d0e017ac-8367-4bb8-9b7f-d72dd068fdb1@acm.org>
Date: Mon, 26 Aug 2024 10:44:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kanchan Joshi <joshi.k@samsung.com>, axboe@kernel.dk, kbusch@kernel.org,
 hch@lst.de, sagi@grimberg.me, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, brauner@kernel.org, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171413epcas5p3f62c2cc57b50d6df8fa66af5fe5996c5@epcas5p3.samsung.com>
 <20240826170606.255718-2-joshi.k@samsung.com>
Content-Language: en-US
In-Reply-To: <20240826170606.255718-2-joshi.k@samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/26/24 10:06 AM,
 Kanchan Joshi wrote: > Change i_write_hint
 (in inode), bi_write_hint (in bio) and write_hint > (in request) to use u8
 data-type rather than this enum. That sounds fishy to me. Why to increase
 the size of this enum? Why to reduce the ability of the compiler to perform
 type checking? I think this needs to be motivated clearly in the patch
 description.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [199.89.1.11 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [199.89.1.11 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [199.89.1.11 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: acm.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sidlL-0007Cb-Up
Subject: Re: [f2fs-dev] [PATCH v4 1/5] fs, block: refactor enum rw_hint
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
From: Bart Van Assche via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bart Van Assche <bvanassche@acm.org>
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/26/24 10:06 AM, Kanchan Joshi wrote:
> Change i_write_hint (in inode), bi_write_hint (in bio) and write_hint
> (in request) to use u8 data-type rather than this enum.

That sounds fishy to me. Why to increase the size of this enum? Why to
reduce the ability of the compiler to perform type checking? I think
this needs to be motivated clearly in the patch description.

Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
