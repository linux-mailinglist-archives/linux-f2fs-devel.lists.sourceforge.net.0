Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 116ABD3B1A6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcizN56YR0R+P6ND9f9I02F67ZurVKi69dGW24rF028=; b=ebKRN6Q8xa8+Sihsw4px0vpRgW
	RNj0UPA2h4u4YpYsDtaZgyNuH0zzKG1ku4+wPXTd0jjuFG2Dyz8uSuoOGvWHoz9kdpNMBEKs8q3rY
	9Ra/XbqJ+xmdbMFreKb7Dy99va0e/ld2u5PNZCIbYFafbykS/59+TfP+Htqp02IYEdv8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhsJz-0006Ym-42;
	Mon, 19 Jan 2026 16:41:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1vhsJx-0006YX-Df
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 16:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=; b=Y3GxgQGMtd1X2kzpgsIoWfsSzs
 uRFnNl9hs1isHLh64/gU3TNpgLoLNIjm7BQmrwUKuop0JZpx6LbIDJG2BDeEP6VXss7zAlFEF8mXK
 CDtpeIkG7oZI2IV52SHaaQLmJFgz8GNXBvWomeEcr7WM2iZ9Q81UpOnTJnNzi6ZMJinA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=; b=dS86clEFp9ngfxP0qofqTUkaHx
 lnhRqjdh+L92kJ0jV0z/5pmT2Ysr/YUjtyYHVbqpvrh3n8m+frUz5///LeJJTW+uTXXu9J7EjeMfN
 eylLyFTFZcKl1cjl9GmWggajdF6trc+kI7hW4bVKvKue9Ay1R0RiNeYIyGAYHAPsR+VU=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhsJx-0000VV-EA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 16:41:41 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so7728200a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 08:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768840890; cv=none;
 d=google.com; s=arc-20240605;
 b=H+zfvaE2bRAkUfmzrjBi0MVcTfmqQsyBQCE1MaKuIIrhmMNim6eF/C8gMJlWDnwq7n
 Zr7aXdSYY8lOKZIJGjQ3GiHCPPP0kcBBY0F9JxIbU/mzBkTGAGz9sZhpCXfw9FjruJ+i
 wAFfOg/vBYI85+mfLf+bPS4Ka29VJX/khktNvm9hS7J5SuwOo8HF4A2r8LMcU36wwRrk
 4Ym9oWJjN//l77VvRkJxXxnopnWEJVPWa/cuzJPzkEyhUtm6euy3mbTGKm0rKqn6M0FR
 XWn6aIiEn8AATIPUTVHuzlIKz9VAaQPcUBv7rlLgbjUJLQW/h8BA6EvY81ctJEww1col
 CHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 fh=nZtfWrNFyf8xRbb4IY4lDNC93WAiJ31+ge1R7WSLfBA=;
 b=N5PVR+TMZBM0ux1UrpkPBwnn1Jt8adY4/VG4mHgRscSKcjWkM9NVUglqRq+fHK22zG
 M56+grQJZCITP7+oqaVh0fiw9rY2KetmaVuyBNaBAtIj7fh0r/bAhxHRch+XeWrXYFQ8
 MF21ZBxyeXKnk1CYux921TaSSh/hPakQL2Nc0r0oWVqqExUnhCw+cRLqv7FcFn0+I7Gn
 RfiwodKT925mPlDGqtgix5dA6qNYUrDsc64aE7HG3iA8XRHNtLjDJu7wy30W/oWol6r/
 9frM2nUn89TLo5qYlblOlnTCBlz700dV+WNwOOVdC+sxd3Pnu3S8ZW55wxQ7SBT9/LNE
 DTpg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768840890; x=1769445690; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 b=JAYwW2EqbJoAgOuUrKfXkH2IJMFKcQJG3D1gBKiVowswT3Yio8BgrjTYYWw52PgkhT
 SyhMb8/+q57RBjrd5xDP1h2Ewzope17QCsz5obO4t4V/twYu936VqmByCedKqt7tYSoh
 Y8mCWHRkM+YKO70cADrSqIDWeW20YotKJDfEpZLbzsnYQlG3ZrZAbzgeXh70sDulNiuR
 6H6tc9tKQa24eQ4rHOiS2admBSWVma4nb8R6I+dSBkEytDnQ26S4uFydDFflImHXwVH9
 fxStNiR2iSk98Rj5jchhsZGOz6XCZ6z4AT2e60OSTh5cq1vdA2VcchNBKRdQCIgD0MNn
 G4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840890; x=1769445690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fTdB35vgqJbH8V4J4HP1Mukd5M1Q72aH7//uMfZpgyU=;
 b=VqbLaOldO5IzTZVlr0lHh2v+IOkv+x3zsMcaJqZcCcplCm0HuQpkTVD3yuzMHNpjDn
 LWl0Ljra7CKWvjXS491gGndLNWMRBw8Vqegq7SC/RcdoJn8yu9pjVjV81M+/IVbkqD/5
 g1e8G6VVycbNvDAuud4/m2g6Uobq+ZlGm3jiPdZZCWrcIgbQER/cwTdnXfdQ7TPXLerc
 5oEv6KZJQZFDU7pEUNi38mMElKGQuJGO/ATmufOYwf9IEW84hROe/Fbe3g5A/hp8uhsT
 DUIm21W24rsf0k9b4nAQOseNf9FaNuiO1EC6YVs68kLDkKTV1RoAW7CnSDAenLN0t5sz
 U5TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwQ7cRQG+uMdbXynbcFqfvQMKZC1VAKFpxkti5SG4SWzN4yR+Ot+H+HrVNzfjFwYLjxinyEY7k8E9aHCcC4vVo@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzAUY7rbRQsdF6SNOnj0c+Znwpyo68GSwgy8/lUeP1dqAiBnLem
 2AVjVGt8w4WUoAwrVPp+htROJN+ts9sAZYikb8GQprpmlpJ2xZVXg+vhJjRrL5ZOjdSZpqpXg7g
 sEyLs8s7lhFXvguCyNeyt/6m9o2QRJrI=
X-Gm-Gg: AZuq6aJKzFsFZ4HZMqW2ObRNnwO5aq7t+uVVRcpvLGdlaR10f5LK4BqLtAmnjJgsduy
 bPHqP21yu5y1KNWkvnuGz1/1sfCE5lV6SkfjAGDmlhNA80oTddo+g3j1HiwmsLYgL0e7AIGx4+D
 GFOVb4hg03Tp1/nZcDBHWEmqWFCuwEyNgLcljGWMTcGwkpTebs0yP43ffKLPd/CSBUNO1plAb18
 dMN+RKv5z/E/XaUILwySTKdx3g4RYgBG/wkZwXvE6gBLGt8wc5Ajp9b7OykkYmnxqGiJzlm6D2N
 F1Soen+LDS4bkdOBZjj1Ul74j+Fryg==
X-Received: by 2002:a05:6402:518b:b0:64e:f6e1:e517 with SMTP id
 4fb4d7f45d1cf-65452cd98e9mr9387079a12.32.1768840889299; Mon, 19 Jan 2026
 08:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
 <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-2-d93368f903bd@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 Jan 2026 17:41:16 +0100
X-Gm-Features: AZwV_QgHvJ6NvIXON-eIYvnT5PkMvN0FHfW-0LujoZ3K-fhpCrZ1N6375iX4_4Y
Message-ID: <CAOQ4uxjX8EcG5XssJ91u8Kn0gY9Rb0qCwnte_7j6Q6knvZ1shw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 5:27 PM Jeff Layton wrote: > > At
 one time, nfsd could take the presence of struct export_operations to > be
 an indicator that a filesystem was exportable via NFS. Since then [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [amir73il(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
X-Headers-End: 1vhsJx-0000VV-EA
Subject: Re: [f2fs-dev] [PATCH v2 02/31] exportfs: add new
 EXPORT_OP_STABLE_HANDLES flag
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-doc@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>,
 David Laight <david.laight.linux@gmail.com>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNToyN+KAr1BNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQXQgb25lIHRpbWUsIG5mc2QgY291bGQgdGFrZSB0aGUgcHJl
c2VuY2Ugb2Ygc3RydWN0IGV4cG9ydF9vcGVyYXRpb25zIHRvCj4gYmUgYW4gaW5kaWNhdG9yIHRo
YXQgYSBmaWxlc3lzdGVtIHdhcyBleHBvcnRhYmxlIHZpYSBORlMuIFNpbmNlIHRoZW4sIGEKPiBs
b3Qgb2YgZmlsZXN5c3RlbXMgaGF2ZSBncm93biBleHBvcnQgb3BlcmF0aW9ucyBpbiBvcmRlciB0
byBwcm92aWRlCj4gZmlsZWhhbmRsZSBzdXBwb3J0LiBTb21lIG9mIHRob3NlIChlLmcuIGtlcm5m
cywgcGlkZnMsIGFuZCBuc2ZzKSBhcmUgbm90Cj4gc3VpdGFibGUgZm9yIGV4cG9ydCB2aWEgTkZT
IHNpbmNlIHRoZXkgbGFjayBmaWxlaGFuZGxlcyB0aGF0IGFyZQo+IHN0YWJsZSBhY3Jvc3MgcmVi
b290Lgo+Cj4gQWRkIGEgbmV3IEVYUE9SVF9PUF9TVEFCTEVfSEFORExFUyBmbGFnIHRoYXQgaW5k
aWNhdGVzIHRoYXQgdGhlCj4gZmlsZXN5c3RlbSBzdXBwb3J0cyBwZXJpc2lzdGVudCBmaWxlaGFu
ZGxlcywKCnBlcnNpc3RlbnQgc3RpbGwgaGVyZT8KIi4uLmFyZSBzdGFibGUgYWNyb3NzIHRoZSBs
aWZldGltZSBvZiBhIGZpbGUiPwoKPiBhIHJlcXVpcmVtZW50IGZvciBuZnMKPiBleHBvcnQuIFdo
aWxlIGluIHRoZXJlLCBzd2l0Y2ggdG8gdGhlIEJJVCgpIG1hY3JvIGZvciBkZWZpbmluZyB0aGVz
ZQo+IGZsYWdzLgoKTWF5YmUgeW91IHdhbnQgdG8gbW92ZSB0aGF0IGNsZWFudXAgdG8gcGF0Y2gg
MSBhbG9uZyB3aXRoIHRoZQpleHBvcnQucnN0IHN5bmM/IG5vdCBhIG11c3QuCgo+Cj4gRm9yIG5v
dywgdGhlIGZsYWcgaXMgbm90IGNoZWNrZWQgYW55d2hlcmUuIFRoYXQgd2lsbCBjb21lIGxhdGVy
IGFmdGVyCj4gd2UndmUgYWRkZWQgaXQgdG8gdGhlIGV4aXN0aW5nIGZpbGVzeXN0ZW1zIHRoYXQg
bmVlZCB0byByZW1haW4KPiBleHBvcnRhYmxlLgo+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxq
YWNrQHN1c2UuY3o+Cj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVs
Lm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9uZnMvZXhwb3J0aW5nLnJz
dCB8ICA3ICsrKysrKysKPiAgaW5jbHVkZS9saW51eC9leHBvcnRmcy5oICAgICAgICAgICAgICAg
ICAgICB8IDE2ICsrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvbmZzL2V4cG9ydGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL25m
cy9leHBvcnRpbmcucnN0Cj4gaW5kZXggMDU4M2EwNTE2YjFlM2EzZTZhMTBhZjk1ZmY4ODUwNmNm
MDJmN2RmNC4uMGMyOWVlNDRlMzQ4NGNlZjg0ZDJkM2Q0NzgxOWFjZjE3MmQyNzVhMyAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL25mcy9leHBvcnRpbmcucnN0Cj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9uZnMvZXhwb3J0aW5nLnJzdAo+IEBAIC0yNDQs
MyArMjQ0LDEwIEBAIGZvbGxvd2luZyBmbGFncyBhcmUgZGVmaW5lZDoKPiAgICAgIG5mc2QuIEEg
Y2FzZSBpbiBwb2ludCBpcyByZWV4cG9ydCBvZiBORlMgaXRzZWxmLCB3aGljaCBjYW4ndCBiZSBk
b25lCj4gICAgICBzYWZlbHkgd2l0aG91dCBjb29yZGluYXRpbmcgdGhlIGdyYWNlIHBlcmlvZCBo
YW5kbGluZy4gT3RoZXIgY2x1c3RlcmVkCj4gICAgICBhbmQgbmV0d29ya2VkIGZpbGVzeXN0ZW1z
IGNhbiBiZSBwcm9ibGVtYXRpYyBoZXJlIGFzIHdlbGwuCj4gKwo+ICsgIEVYUE9SVF9PUF9TVEFC
TEVfSEFORExFUyAtIFRoaXMgZmlsZXN5c3RlbSBwcm92aWRlcyBmaWxlaGFuZGxlcyB0aGF0IGFy
ZQo+ICsgICAgc3RhYmxlIGFjcm9zcyB0aGUgbGlmZXRpbWUgb2YgYSBmaWxlLiBUaGlzIGlzIGEg
aGFyZCByZXF1aXJlbWVudCBmb3IgZXhwb3J0Cj4gKyAgICB2aWEgbmZzZC4gQW55IGZpbGVzeXN0
ZW0gdGhhdCBpcyBlbGlnaWJsZSB0byBiZSBleHBvcnRlZCB2aWEgbmZzZCBtdXN0Cj4gKyAgICBp
bmRpY2F0ZSB0aGlzIGd1YXJhbnRlZSBieSBzZXR0aW5nIHRoaXMgZmxhZy4gTW9zdCBkaXNrLWJh
c2VkIGZpbGVzeXN0ZW1zCj4gKyAgICBjYW4gZG8gdGhpcyBuYXR1cmFsbHkuIFBzZXVkb2ZpbGVz
eXN0ZW1zIHRoYXQgYXJlIGZvciBsb2NhbCByZXBvcnRpbmcgYW5kCj4gKyAgICBjb250cm9sIChl
LmcuIGtlcm5mcywgcGlkZnMsIG5zZnMpIHVzdWFsbHkgY2FuJ3Qgc3VwcG9ydCB0aGlzLgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2V4cG9ydGZzLmggYi9pbmNsdWRlL2xpbnV4L2V4cG9y
dGZzLmgKPiBpbmRleCBmMGNmMjcxNGVjNTJkZDk0MmI4ZjFjNDU1YTI1NzAyYmQ3ZTQxMmIzLi5j
NGUwZjA4MzI5MGU3ZTM0MTM0MmNmMGI0NWI1OGZkZGRhM2FmNjVlIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhwb3J0ZnMuaAo+
IEBAIC0zLDYgKzMsNyBAQAo+ICAjZGVmaW5lIExJTlVYX0VYUE9SVEZTX0ggMQo+Cj4gICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgo+ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGF0aC5oPgo+Cj4gIHN0cnVjdCBkZW50cnk7Cj4gQEAgLTI3NywxNSArMjc4LDE2
IEBAIHN0cnVjdCBleHBvcnRfb3BlcmF0aW9ucyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbnJfaW9tYXBzLCBzdHJ1Y3QgaWF0dHIgKmlhdHRyKTsKPiAgICAgICAgIGludCAo
KnBlcm1pc3Npb24pKHN0cnVjdCBoYW5kbGVfdG9fcGF0aF9jdHggKmN0eCwgdW5zaWduZWQgaW50
IG9mbGFncyk7Cj4gICAgICAgICBzdHJ1Y3QgZmlsZSAqICgqb3BlbikoY29uc3Qgc3RydWN0IHBh
dGggKnBhdGgsIHVuc2lnbmVkIGludCBvZmxhZ3MpOwo+IC0jZGVmaW5lICAgICAgICBFWFBPUlRf
T1BfTk9XQ0MgICAgICAgICAgICAgICAgICgweDEpIC8qIGRvbid0IGNvbGxlY3QgdjMgd2NjIGRh
dGEgKi8KPiAtI2RlZmluZSAgICAgICAgRVhQT1JUX09QX05PU1VCVFJFRUNISyAgICAgICAgICAo
MHgyKSAvKiBubyBzdWJ0cmVlIGNoZWNraW5nICovCj4gLSNkZWZpbmUgICAgICAgIEVYUE9SVF9P
UF9DTE9TRV9CRUZPUkVfVU5MSU5LICAgKDB4NCkgLyogY2xvc2UgZmlsZXMgYmVmb3JlIHVubGlu
ayAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9SRU1PVEVfRlMgICAgICAgICAgICAoMHg4KSAvKiBG
aWxlc3lzdGVtIGlzIHJlbW90ZSAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9OT0FUT01JQ19BVFRS
ICAgICAgICAgICAgICAgICgweDEwKSAvKiBGaWxlc3lzdGVtIGNhbm5vdCBzdXBwbHkKPiArI2Rl
ZmluZSBFWFBPUlRfT1BfTk9XQ0MgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkgLyogZG9u
J3QgY29sbGVjdCB2MyB3Y2MgZGF0YSAqLwo+ICsjZGVmaW5lIEVYUE9SVF9PUF9OT1NVQlRSRUVD
SEsgICAgICAgICBCSVQoMSkgLyogbm8gc3VidHJlZSBjaGVja2luZyAqLwo+ICsjZGVmaW5lIEVY
UE9SVF9PUF9DTE9TRV9CRUZPUkVfVU5MSU5LICBCSVQoMikgLyogY2xvc2UgZmlsZXMgYmVmb3Jl
IHVubGluayAqLwo+ICsjZGVmaW5lIEVYUE9SVF9PUF9SRU1PVEVfRlMgICAgICAgICAgICBCSVQo
MykgLyogRmlsZXN5c3RlbSBpcyByZW1vdGUgKi8KPiArI2RlZmluZSBFWFBPUlRfT1BfTk9BVE9N
SUNfQVRUUiAgICAgICAgICAgICAgICBCSVQoNCkgLyogRmlsZXN5c3RlbSBjYW5ub3Qgc3VwcGx5
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG9t
aWMgYXR0cmlidXRlIHVwZGF0ZXMKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLwo+IC0jZGVmaW5lIEVYUE9SVF9PUF9GTFVTSF9PTl9DTE9TRSAgICAg
ICAoMHgyMCkgLyogZnMgZmx1c2hlcyBmaWxlIGRhdGEgb24gY2xvc2UgKi8KPiAtI2RlZmluZSBF
WFBPUlRfT1BfTk9MT0NLUyAgICAgICAgICAgICAgKDB4NDApIC8qIG5vIGZpbGUgbG9ja2luZyBz
dXBwb3J0ICovCj4gKyNkZWZpbmUgRVhQT1JUX09QX0ZMVVNIX09OX0NMT1NFICAgICAgIEJJVCg1
KSAvKiBmcyBmbHVzaGVzIGZpbGUgZGF0YSBvbiBjbG9zZSAqLwo+ICsjZGVmaW5lIEVYUE9SVF9P
UF9OT0xPQ0tTICAgICAgICAgICAgICBCSVQoNikgLyogbm8gZmlsZSBsb2NraW5nIHN1cHBvcnQg
Ki8KPiArI2RlZmluZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgICAgICAgQklUKDcpIC8qIGZo
cyBhcmUgc3RhYmxlIGFjcm9zcyByZWJvb3QgKi8KPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgICBm
bGFnczsKPiAgfTsKPgo+Cj4gLS0KPiAyLjUyLjAKPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
