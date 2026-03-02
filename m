Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG32IRT4pWkeIgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:50:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83C1E0D5F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdplULjerb/GUcew1GwSDxE51fS0VSi1K8rFqiuHLlY=; b=di/MNOvlax23XjUomfJkT/cT66
	32+scm/+Nz3G6bZCmWCIrycQV+S17Zey3cNCEEhZ2wOTtSKCCdO0J/61hL4thJNwesdzhHGbJzk95
	LpBmTkZ6pG1brCOjlCfHsNYyzlOS4tMNkDjyGtRVhGxeRdp4v+u1whasY8otMaqXmT+Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxADi-00047K-DI;
	Mon, 02 Mar 2026 20:50:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxADf-00046x-Ow;
 Mon, 02 Mar 2026 20:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=khNugZudWESZiAwFc0P7ueANTJm9n8WmeKMlz46cHIg=; b=h35TzOGjiYnTzyNba0XOw6YIF3
 cn2xTgljYBai3O7QwceP5suE+az3zKsnFm2ioYDonzi702lAYZQCA0KuVYMSHSib0IpvKxCpNZe/w
 XOs/bZcFL13s0YNY1jz0Qld3xFFbNx3FnPsMaxmxOJ0ufUMfkCi3pLjXc/Bt5JZifYg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=khNugZudWESZiAwFc0P7ueANTJm9n8WmeKMlz46cHIg=; b=c6LICnVOtYXXqFUDjZ857Jq7Fe
 Xrmj24xCwphBxZXJUpegSyhnN79+lC0AksKvQERwxqMdAqDiKHIhHD0BzPDmG38EoK6FGMoUNMo9w
 J1AHRlG6wP82VWDdq4JzZo4jQX3nO0ha+pY8SoEHgmDO0jLWl5J1qiwcoR/M8tZhIl+0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxADe-0007E8-K2; Mon, 02 Mar 2026 20:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6816861850;
 Mon,  2 Mar 2026 20:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F66C2BC9E;
 Mon,  2 Mar 2026 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484611;
 bh=JPKwVFtY7y15aQ0ACp/RNYZdvktcOhYNyEwOFBbpajk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mQXhr50rPhqiJaAE46QOiQaS1GigGjkyfHU3ea3xTGDwDSg8agj+bvmfu8MnTBaye
 uHx4YUJ72av/YaUG/IWhxpZdm8qR3c6BFTW9Ut82dfdCNhsx4BEExWOLvQxZq6Jw9G
 MD7rARU6qbSA+OdYE+b0EaHDtIRVRUa0wLLow63W+qb0UzN2PMcHRgq6qwdRB4MQMM
 GsVH7DA1fdahoGFwNQXviOC6OoZ4O1c5cjj/wfYPqtXBnAAYRaR3RlWIRPMWGxj0+Y
 Q91z5L3PWaadybVNCcLcB+3tZsv5jATjvMXnDqHhEIdHSBN5EN2s/XLlsUnaPRzW2n
 7tBeLDlmeJY3A==
Date: Mon, 02 Mar 2026 15:25:29 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-105-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, 
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9058; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=JPKwVFtY7y15aQ0ACp/RNYZdvktcOhYNyEwOFBbpajk=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIMT/IJ3kLMsyWUGkmj+RutCWvyg3pdXWUeJ
 H7H/xONu9SJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyDAAKCRAADmhBGVaC
 FfBtD/9v/x6SpHlOSfRtgdtFXChydGJ/cGAt4/OmHih3k6NV/wtpjljKPdT7Zjdb4vM/BMdd/o4
 JAhmm5IpWH1G+jOCQsYjN3xwArrxf8ryZj5iRaiG4NyWar1Matm0j9mTAX/H/qNcbgdZZYzhHsp
 fLgKEcGnaDnMWCfmCgy2cuh+oTNm+58kA6W4PgVd/ki+3GnYCdcc0Tpj7tU5gON1PwXmCHpykcK
 OOffwvnN2dS4TQBEpVe/j5MQiXBob3RKe93n7sgkj1dq9TEtcnbgVF438aOP/1xU743aj6yGhQ4
 b55WP3ctl83nYaAZ95lSqwEhFEyW7VwXqHG1qa3qeixLYgH5v1yisAIdgnndT7cifui1Wsk2j5w
 c9e4VqpUO6hrueXltvFOSd7I8q5blS56BCPZEMwOgp0u43DapU9PubWIr/HkltUtQnmzNDaJjIs
 aW5op6certMTpHX9PrraMBr/YUFVColSfUR5u2Fc2HasmF46xOxxgrgoVZIFk+u5N9mBnQxJb5T
 N7gvIrulbELxl9kEyuPdwML1vSsKufgZ7J60DKuCHgZqckSpFR75PBjlwTKu+xCa6c1QN+qeA7P
 MHWFgYI6OwzU9ekLenKBJhWxqdJKbk44hkMyOercoxNUkM62lhqVgf5vgvSxytlqwD0SC7gaqaL
 9qZuOp4OR7pRn7g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64 and the PRIino format macro has been
 removed,
 replace all uses in security with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- security/apparmor/apparmorfs.c | 4 ++--
 security/integrity/integrity_audit.c | 2 +- security/ipe/audit.c | 2 +-
 security/lsm_audit.c | 10 +++++----- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxADe-0007E8-K2
Subject: [f2fs-dev] [PATCH v2 105/110] security: replace PRIino with
 %llu/%llx format strings
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: AF83C1E0D5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jlayton@kernel.org]
X-Rspamd-Action: no action

Now that i_ino is u64 and the PRIino format macro has been removed,
replace all uses in security with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 security/apparmor/apparmorfs.c       |  4 ++--
 security/integrity/integrity_audit.c |  2 +-
 security/ipe/audit.c                 |  2 +-
 security/lsm_audit.c                 | 10 +++++-----
 security/selinux/hooks.c             | 10 +++++-----
 security/smack/smack_lsm.c           | 12 ++++++------
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index be343479f80b71566be6fda90fc4e00912faad63..7b645f40e71c956f216fa6a7d69c3ecd4e2a5ff4 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -149,7 +149,7 @@ static int aafs_count;
 
 static int aafs_show_path(struct seq_file *seq, struct dentry *dentry)
 {
-	seq_printf(seq, "%s:[%" PRIino "u]", AAFS_NAME, d_inode(dentry)->i_ino);
+	seq_printf(seq, "%s:[%llu]", AAFS_NAME, d_inode(dentry)->i_ino);
 	return 0;
 }
 
@@ -2644,7 +2644,7 @@ static int policy_readlink(struct dentry *dentry, char __user *buffer,
 	char name[32];
 	int res;
 
-	res = snprintf(name, sizeof(name), "%s:[%" PRIino "u]", AAFS_NAME,
+	res = snprintf(name, sizeof(name), "%s:[%llu]", AAFS_NAME,
 		       d_inode(dentry)->i_ino);
 	if (res > 0 && res < sizeof(name))
 		res = readlink_copy(buffer, buflen, name, strlen(name));
diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
index d28dac23a4e7cf651856b80ab7756d250187ccde..d8d9e5ff1cd22b091f462d1e83d28d2d6bd983e9 100644
--- a/security/integrity/integrity_audit.c
+++ b/security/integrity/integrity_audit.c
@@ -62,7 +62,7 @@ void integrity_audit_message(int audit_msgno, struct inode *inode,
 	if (inode) {
 		audit_log_format(ab, " dev=");
 		audit_log_untrustedstring(ab, inode->i_sb->s_id);
-		audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+		audit_log_format(ab, " ino=%llu", inode->i_ino);
 	}
 	audit_log_format(ab, " res=%d errno=%d", !result, errno);
 	audit_log_end(ab);
diff --git a/security/ipe/audit.c b/security/ipe/audit.c
index 0de95dd4fbea15d4d913fc42e197c3120a9d24a0..93fb59fbddd60b56c0b22be2a38b809ef9e18b76 100644
--- a/security/ipe/audit.c
+++ b/security/ipe/audit.c
@@ -153,7 +153,7 @@ void ipe_audit_match(const struct ipe_eval_ctx *const ctx,
 		if (inode) {
 			audit_log_format(ab, " dev=");
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
-			audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+			audit_log_format(ab, " ino=%llu", inode->i_ino);
 		} else {
 			audit_log_format(ab, " dev=? ino=?");
 		}
diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 523f2ee116f0f928003aec30a105d6d4ecb49b0b..737f5a263a8f79416133315edf363ece3d79c722 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -202,7 +202,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 		if (inode) {
 			audit_log_format(ab, " dev=");
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
-			audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+			audit_log_format(ab, " ino=%llu", inode->i_ino);
 		}
 		break;
 	}
@@ -215,7 +215,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 		if (inode) {
 			audit_log_format(ab, " dev=");
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
-			audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+			audit_log_format(ab, " ino=%llu", inode->i_ino);
 		}
 		break;
 	}
@@ -228,7 +228,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 		if (inode) {
 			audit_log_format(ab, " dev=");
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
-			audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+			audit_log_format(ab, " ino=%llu", inode->i_ino);
 		}
 
 		audit_log_format(ab, " ioctlcmd=0x%hx", a->u.op->cmd);
@@ -246,7 +246,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 		if (inode) {
 			audit_log_format(ab, " dev=");
 			audit_log_untrustedstring(ab, inode->i_sb->s_id);
-			audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+			audit_log_format(ab, " ino=%llu", inode->i_ino);
 		}
 		break;
 	}
@@ -265,7 +265,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 		}
 		audit_log_format(ab, " dev=");
 		audit_log_untrustedstring(ab, inode->i_sb->s_id);
-		audit_log_format(ab, " ino=%" PRIino "u", inode->i_ino);
+		audit_log_format(ab, " ino=%llu", inode->i_ino);
 		rcu_read_unlock();
 		break;
 	}
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 9430f44c81447708c67ddc35c5b4254f16731b8f..8f38de4d223ea59cfea6bbe73747d7b228e0c33f 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1400,7 +1400,7 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
 	if (rc < 0) {
 		kfree(context);
 		if (rc != -ENODATA) {
-			pr_warn("SELinux: %s:  getxattr returned %d for dev=%s ino=%" PRIino "u\n",
+			pr_warn("SELinux: %s:  getxattr returned %d for dev=%s ino=%llu\n",
 				__func__, -rc, inode->i_sb->s_id, inode->i_ino);
 			return rc;
 		}
@@ -1412,13 +1412,13 @@ static int inode_doinit_use_xattr(struct inode *inode, struct dentry *dentry,
 					     def_sid, GFP_NOFS);
 	if (rc) {
 		char *dev = inode->i_sb->s_id;
-		kino_t ino = inode->i_ino;
+		u64 ino = inode->i_ino;
 
 		if (rc == -EINVAL) {
-			pr_notice_ratelimited("SELinux: inode=%" PRIino "u on dev=%s was found to have an invalid context=%s.  This indicates you may need to relabel the inode or the filesystem in question.\n",
+			pr_notice_ratelimited("SELinux: inode=%llu on dev=%s was found to have an invalid context=%s.  This indicates you may need to relabel the inode or the filesystem in question.\n",
 					      ino, dev, context);
 		} else {
-			pr_warn("SELinux: %s:  context_to_sid(%s) returned %d for dev=%s ino=%" PRIino "u\n",
+			pr_warn("SELinux: %s:  context_to_sid(%s) returned %d for dev=%s ino=%llu\n",
 				__func__, context, -rc, dev, ino);
 		}
 	}
@@ -3477,7 +3477,7 @@ static void selinux_inode_post_setxattr(struct dentry *dentry, const char *name,
 					   &newsid);
 	if (rc) {
 		pr_err("SELinux:  unable to map context to SID"
-		       "for (%s, %" PRIino "u), rc=%d\n",
+		       "for (%s, %llu), rc=%d\n",
 		       inode->i_sb->s_id, inode->i_ino, -rc);
 		return;
 	}
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 22b6bd322840c82697c38c07b19a4677e7da2598..2eb3368a3632b836df54ba8628c16f7215ddf3ea 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -182,7 +182,7 @@ static int smk_bu_inode(struct inode *inode, int mode, int rc)
 	char acc[SMK_NUM_ACCESS_TYPE + 1];
 
 	if (isp->smk_flags & SMK_INODE_IMPURE)
-		pr_info("Smack Unconfined Corruption: inode=(%s %" PRIino "u) %s\n",
+		pr_info("Smack Unconfined Corruption: inode=(%s %llu) %s\n",
 			inode->i_sb->s_id, inode->i_ino, current->comm);
 
 	if (rc <= 0)
@@ -195,7 +195,7 @@ static int smk_bu_inode(struct inode *inode, int mode, int rc)
 
 	smk_bu_mode(mode, acc);
 
-	pr_info("Smack %s: (%s %s %s) inode=(%s %" PRIino "u) %s\n", smk_bu_mess[rc],
+	pr_info("Smack %s: (%s %s %s) inode=(%s %llu) %s\n", smk_bu_mess[rc],
 		tsp->smk_task->smk_known, isp->smk_inode->smk_known, acc,
 		inode->i_sb->s_id, inode->i_ino, current->comm);
 	return 0;
@@ -214,7 +214,7 @@ static int smk_bu_file(struct file *file, int mode, int rc)
 	char acc[SMK_NUM_ACCESS_TYPE + 1];
 
 	if (isp->smk_flags & SMK_INODE_IMPURE)
-		pr_info("Smack Unconfined Corruption: inode=(%s %" PRIino "u) %s\n",
+		pr_info("Smack Unconfined Corruption: inode=(%s %llu) %s\n",
 			inode->i_sb->s_id, inode->i_ino, current->comm);
 
 	if (rc <= 0)
@@ -223,7 +223,7 @@ static int smk_bu_file(struct file *file, int mode, int rc)
 		rc = 0;
 
 	smk_bu_mode(mode, acc);
-	pr_info("Smack %s: (%s %s %s) file=(%s %" PRIino "u %pD) %s\n", smk_bu_mess[rc],
+	pr_info("Smack %s: (%s %s %s) file=(%s %llu %pD) %s\n", smk_bu_mess[rc],
 		sskp->smk_known, smk_of_inode(inode)->smk_known, acc,
 		inode->i_sb->s_id, inode->i_ino, file,
 		current->comm);
@@ -244,7 +244,7 @@ static int smk_bu_credfile(const struct cred *cred, struct file *file,
 	char acc[SMK_NUM_ACCESS_TYPE + 1];
 
 	if (isp->smk_flags & SMK_INODE_IMPURE)
-		pr_info("Smack Unconfined Corruption: inode=(%s %" PRIino "u) %s\n",
+		pr_info("Smack Unconfined Corruption: inode=(%s %llu) %s\n",
 			inode->i_sb->s_id, inode->i_ino, current->comm);
 
 	if (rc <= 0)
@@ -253,7 +253,7 @@ static int smk_bu_credfile(const struct cred *cred, struct file *file,
 		rc = 0;
 
 	smk_bu_mode(mode, acc);
-	pr_info("Smack %s: (%s %s %s) file=(%s %" PRIino "u %pD) %s\n", smk_bu_mess[rc],
+	pr_info("Smack %s: (%s %s %s) file=(%s %llu %pD) %s\n", smk_bu_mess[rc],
 		sskp->smk_known, smk_of_inode(inode)->smk_known, acc,
 		inode->i_sb->s_id, inode->i_ino, file,
 		current->comm);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
